class AddAnnTypeToAnnotations < ActiveRecord::Migration
  def change
    add_column :annotations, :anntype, :string
  end
end
