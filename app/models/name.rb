class Name < ActiveRecord::Base
  has_and_belongs_to_many :pages
  attr_accessible :eol_page_id, :eol_thumb, :lookup_fail, :name_bank_id, :string
  
  def self.find_names_in_volume(volume_id)
    return self.find_by_sql("select distinct(names.string) from names 
                          inner join page_names on names.id=page_names.name_id
                          inner join pages on pages.id=page_names.page_id
                          where volume_id=#{volume_id}")
  end
  
  def clean_name
    return string.gsub('[', '').gsub(']','').gsub('"', '').gsub("'", "")
  end
end
