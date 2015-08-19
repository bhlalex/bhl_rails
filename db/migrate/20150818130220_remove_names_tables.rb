class RemoveNamesTables < ActiveRecord::Migration
  def up
    drop_table :pages
    drop_table :names
    drop_table :page_names
  end

  def down
  end
end
