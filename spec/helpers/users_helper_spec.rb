require 'spec_helper'
require_relative '../../lib/bhl/login'

include BHL::Login

describe UsersHelper do
  it 'should return true/false when user is logged in/out' do
    truncate_table(ActiveRecord::Base.connection, "users", {})
    logged_in?.should be_false
    user = User.gen()
    log_in(user)
    logged_in?.should be_true
    
  end
end
