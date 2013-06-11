class Page < ActiveRecord::Base
  belongs_to :volume
  has_many :page_names
  has_many :names, :through => :page_names
  attr_accessible :fill_names_fail, :is_empty, :page_number, :volume

  def get_page_content
    file_location = File.join(Rails.root, "public", "volumes", "#{volume.job_id.to_s}","pages", "#{page_number}.txt")
    open(file_location, 'r') do |file|
      return file.read
    end 
  end
end
