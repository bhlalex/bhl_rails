class Name < ActiveRecord::Base
  has_and_belongs_to_many :page
  attr_accessible :eol_page_id, :eol_thumb, :lookup_fail, :name_bank_id, :string
end
