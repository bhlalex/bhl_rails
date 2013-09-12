class AddVerificationCodeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :verification_code, :string
    add_column :users, :verified_date, :datetime
    add_column :users, :last_login, :datetime
  end

  def self.down
    remove_column :users, :verification_code
    remove_column :users, :verified_date
    remove_column :users, :last_login
  end
end
