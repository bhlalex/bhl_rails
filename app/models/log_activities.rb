class LogActivities < ActiveRecord::Base
  #class_inheritable_accessor :columns
#  self.columns = []

  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end
  
  def self.columns()
 @columns ||= [];
 end
 
  column :table_type, :string
  column :id, :integer
  column :time, :datetime

#  belongs_to :recommendable, :polymorphic => true
#
#  validates_presence_of :recommendable
end