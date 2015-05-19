require 'name-spotter'

namespace :taxon_finder do

  desc 'Find names in pages'
  task :find_names => :environment do
    puts "Start Time: " + Time.now.strftime('%d/%m/%Y %H:%M')
    tf_client = NameSpotter::TaxonFinderClient.new(host: NAME_SPOTTER_IP, port: NAME_SPOTTER_PORT)
    tf_name_spotter = NameSpotter.new(tf_client)

    volumes = Volume.where("id > 246").limit(1000)
    volume_count = volumes.count

    volumes.each_with_index do |volume, index|
      puts "#{index+1}/#{volume_count}\n"
      
      begin
        f = File.open("#{PAGES_FOLDER}#{volume.job_id}-#{volume.id}", "r")
        f.each_line do |line|
          unless line.blank?
            page_number = line.split(' ', 2)[0].split('-', 3)[2]
            page = Page.create(:page_number => page_number)
            volume.pages << page
            #volume.pages << Page.create(:page_number => page_number)
            page_content = line.split(' ', 2)[1]  
            #page = Page.find_by_volume_id_and_page_number(volume.id, page_number)
            begin
              doc = Nokogiri::XML(tf_name_spotter.find(page_content, "xml"))
              puts "#{doc.xpath("//names//scientificName").count} name found"
              doc.xpath("//names//scientificName").each_with_index do |scName, scIndex|
                name = Name.find_or_create_by_string(scName.text.sub("[", "").sub("]", ""))
                page_name = PageName.new(:page => page, :name => name, :namestring => doc.xpath("//names//verbatim")[scIndex].text) # Get name found
                page.page_names << page_name
              end
              page.update_attribute("fill_names_fail", 0)
            rescue
              page.update_attribute("fill_names_fail", 1)
            end
            page.save
          end
        end
        f.close
        #volume.fill_content_fail = 0
        #volume.save
      
        puts "End Time: " + Time.now.strftime('%d/%m/%Y %H:%M')
      rescue
        puts "Failed to find file: #{volume.job_id}-#{volume.id}"
      end
    end
  end
end
