require 'spec_helper'
require_relative '../../lib/bhl/login'

include BHL::Login
describe UserSearchHistoryController do

      before(:each) do
        truncate_table(ActiveRecord::Base.connection, "users", {})
        truncate_table(ActiveRecord::Base.connection, "queries", {})
        User.gen() unless User.first
        @user = User.first
        log_in(@user)
        @query = Query.create(:user_id => @user.id, :string => "_content=smith")
      end

      it "should save the query" do
        request.env["HTTP_REFERER"] = "/books?_content=ras"
        lambda do
        post :save_query, :query => "_content=smith", :user_id =>@user.id
        response.should redirect_to("/books?_content=ras")
        end.should change(Query, :count).by(1)
      end

    it "should destroy the query" do
      request.env["HTTP_REFERER"] = "/users/#{@user.id}"
      lambda do
      delete :delete_query, :id => @query
      response.should redirect_to("/users/#{@user.id}")
      end.should change(Query, :count).by(-1)
    end

end