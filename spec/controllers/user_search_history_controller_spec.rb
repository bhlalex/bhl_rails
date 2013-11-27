require 'spec_helper'

describe UserSearchHistoryController do

      before(:each) do
        @user =User.create(:email => "user@example.com")
        @query = Query.create( :string => "_content=smith")
      end

      it "should save the query" do
        request.env["HTTP_REFERER"] = "/books?_content=ras"
        lambda do
        post :save_query, :query => "_content=smith"
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