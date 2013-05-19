class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.references :volume
      t.references :page
      t.string :string
      t.integer :location_x
      t.integer :location_y
      t.integer :height
      t.integer :width
      t.integer :zorder
      t.integer :hltype
      t.string :type

      t.timestamps
    end
    add_index :annotations, :volume_id
    add_index :annotations, :page_id
  end
end
