require 'spec_helper'

describe UsersController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'forgot_password'" do
    it "returns http success" do
      get 'forgot_password'
      response.should be_success
    end
  end

  describe "GET 'change_password'" do
    it "returns http success" do
      get 'change_password'
      response.should be_success
    end
  end

end
