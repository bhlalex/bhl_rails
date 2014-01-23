class AddLastLoginLanguageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_login_language, :string
  end
end
