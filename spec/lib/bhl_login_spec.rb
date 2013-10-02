require 'spec_helper'
require_relative '../../lib/bhl/login'

include BHL::Login

describe BHL do
  it 'should validate login mechanism' do
    user = User.gen
    login(user)
    session[:user_id].should_equal user.id
    session[:active].should_equal user.active
    session[:real_name].should_equal user.real_name
    session[:guid].should_equal user.guid
  end
end
