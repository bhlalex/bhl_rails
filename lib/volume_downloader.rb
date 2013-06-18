require File.dirname(__FILE__) + "/bhl"

module DAR
  class VolumeDownloader    
    
    def self.download_empty_thumbs
      volumes = Volume.where('get_thumbnail_fail is null or get_thumbnail_fail=1')
      success = 0
      failed = 0
      total =  volumes.count 
      volumes.each_with_index do |volume, index|
        puts "#{index+1}/#{total}: Downloading thumb: #{volume.job_id}"
        
        if download_thumb(volume.job_id)
          volume.get_thumbnail_fail=0
          puts "success"
          success = success + 1 
        else
          volume.get_thumbnail_fail=1
          puts "failed"
          failed = failed + 1
        end        
        volume.save
      end
      
      puts "#{total} Volumes: #{success} success, #{failed} failed"
    end
    
    def self.download_empty_volume_content
      volumes = Volume.where('fill_content_fail is null or fill_content_fail=1')
            
      success = 0
      failed = 0
      total =  volumes.count 
      
      volumes.each_with_index do |volume, index|
        puts "#{index+1}/#{total}: Downloading content: #{volume.job_id}"        
        if download_content_xml(volume.job_id)
          puts "Download Success"
          puts "Processing file"
          if process_content(volume)
            success = success + 1  
            puts "Success"
            volume.fill_content_fail=0
          else
            failed = failed + 1
            volume.fill_content_fail=1
            puts "Error processing file"     
          end                    
        else
          failed = failed + 1
          volume.fill_content_fail=1
          puts "Error downloading file"
        end        
        volume.save
      end      
      puts "#{total} Volumes: #{success} success, #{failed} failed"
    end
    
    
    private 
    
    def self.download_thumb(job_id)
      file_url = DAR_API_THUMBNAIL.sub DAR_API_THUMBNAIL_JOBID_STRING, job_id.to_s
      unless File.directory?(File.join(Rails.root, "public", "volumes", "#{job_id.to_s}"))
        FileUtils.mkdir_p(File.join(Rails.root, "public", "volumes", "#{job_id.to_s}"))
      end      
      file_location = File.join(Rails.root, "public", "volumes", "#{job_id.to_s}","thumb.jpg")
      
      thumb_xml = BHL::Downloader.download_file(file_url)
      
      # this means that downloading xml fails
      unless thumb_xml
        return false
      end
      doc = Nokogiri::XML(thumb_xml)
      
      thumbnail = doc.xpath("//Thumbnail")
      
      return "false" unless thumbnail
      
      thumb_url = thumbnail.text
      
      thumb_file = BHL::Downloader.download_file(thumb_url)
      
      return false unless thumb_file        
      
      open(file_location, 'w') do |file| 
        file.binmode # must be in binary mode
        file.write thumb_file
        file.rewind
      end
      return true
    end
  
    def self.download_content_xml(job_id)
      file_url = DAR_API_CONTENT.sub DAR_API_CONTENT_JOBID_STRING, job_id.to_s
      # creating volume folder
      unless File.directory?(File.join(Rails.root, "public", "volumes", "#{job_id.to_s}"))
        FileUtils.mkdir_p(File.join(Rails.root, "public", "volumes", "#{job_id.to_s}"))
      end
      # creating pages folder
      unless File.directory?(File.join(Rails.root, "public", "volumes", "#{job_id.to_s}", "pages"))
        FileUtils.mkdir_p(File.join(Rails.root, "public", "volumes", "#{job_id.to_s}", "pages"))
      end
      file_location = File.join(Rails.root, "public", "volumes", "#{job_id.to_s}", "content.xml")
      
      content_xml = BHL::Downloader.download_file(file_url)
      
      # this means that downloading xml fails
      unless content_xml
        return false
      end
      
      open(file_location, 'w') do |file|
        file.binmode # save it as is
        file.write content_xml
      end
      return true
    end
    
    def self.process_content(volume)
      job_id = volume.job_id
      file_location = File.join(Rails.root, "public", "volumes", "#{job_id.to_s}", "content.xml")
      f = File.open(file_location)
      doc = Nokogiri::XML(f)
      f.close
      
      unless doc.root()
        return false
      end
      
      volume.pages.clear
      
      doc.xpath("//DjVuXML//BODY//OBJECT").each do |obj|
        page_number = get_page_number(obj)
        
        content = []
        
        obj.xpath(".//HIDDENTEXT//PAGECOLUMN//REGION//PARAGRAPH//LINE").each do |line|
          line_content = []
          line.xpath(".//WORD").each do |word|
            line_content << word.text unless word.text.empty?
          end          
          content << "#{line_content.join(" ")}\r\n" unless line_content.empty?
        end
        
        save_content(job_id, content.join(""), page_number)
        
        volume.pages << Page.create(:page_number => page_number, :is_empty => content.empty?)         
      end
            
      return true
    end
    
    def self.get_page_number(obj)      
      page_text = obj.search('PARAM[name="PAGE"]').attr("value").to_s
      begin
        return Integer(page_text)              
      rescue
        begin
          return page_text.split(".")[0].split("_")[1].to_i
        rescue
          return 0
        end  
      end
    end
    
    def self.save_content(job_id, content, page_number)
      file_location = File.join(Rails.root, "public", "volumes", "#{job_id.to_s}", "pages", "#{page_number}.txt")
      open(file_location, 'w') do |file|
        file.binmode # save it as is
        file.write content
      end
    end
  end
end
