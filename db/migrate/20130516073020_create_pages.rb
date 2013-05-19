class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :volume
      t.integer :page_number
      t.boolean :is_empty
      t.integer :fill_names_fail

      t.timestamps
    end
    add_index :pages, :volume_id
  end
end
