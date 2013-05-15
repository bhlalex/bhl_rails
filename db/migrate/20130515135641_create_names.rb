class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string :string
      t.integer :eol_page_id
      t.string :eol_thumb
      t.integer :lookup_fail
      t.integer :name_bank_id

      t.timestamps
    end
  end
end
