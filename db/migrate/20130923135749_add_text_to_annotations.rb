class AddTextToAnnotations < ActiveRecord::Migration
  def change
    add_column :annotations, :text, :string
  end
end
