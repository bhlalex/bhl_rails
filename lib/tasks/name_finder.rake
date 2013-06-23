require 'name-spotter'

namespace :taxon_finder do

  desc 'Find names in pages'
  task :find_names => :environment do
    tf_client = NameSpotter::TaxonFinderClient.new(host: NAME_SPOTTER_IP, port: NAME_SPOTTER_PORT)
    tf_name_spotter = NameSpotter.new(tf_client)
    
    #pages = Page.where("id<5933")
    pages = Page.where("fill_names_fail is null or fill_names_fail=1")
    pages_count = pages.count
    
    pages.each_with_index do |page, index|
      
      puts "#{index+1}/#{pages_count}"
      
      file_location = File.join(Rails.root, "public", "volumes", "#{page.volume.job_id.to_s}","pages", "#{page.page_number}.txt") 
      # removing old association
      PageName.where(:page_id => page.id).destroy_all      
      
      open(file_location, 'r') do |file|
        doc = Nokogiri::XML(tf_name_spotter.find(file.read, "xml"))
        puts "#{doc.xpath("//names//scientificName").count} name found"
        doc.xpath("//names//scientificName").each_with_index do |scName, scIndex|
          name = Name.find_or_create_by_string(scName.text.sub("[", "").sub("]", ""))
          page_name = PageName.new(:page => page, :name => name, :namestring => doc.xpath("//names//verbatim")[scIndex].text) # Get name found
          page.page_names << page_name
        end
      end
      
      page.fill_names_fail = 1
      page.save      
    end
  end
end