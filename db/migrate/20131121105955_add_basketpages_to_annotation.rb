class AddBasketpagesToAnnotation < ActiveRecord::Migration
  def change
    add_column :annotations, :basketpages, :string
  end
end
