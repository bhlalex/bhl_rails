class UserSearchHistoryController < ApplicationController
    def save_query
      query = Query.new(:user_id => params[:user_id].to_i, :string => params[:query])
      query.save
      flash.now[:notice] = I18n.t(:query_saved)
      flash.keep
      redirect_to :back
    end
  
    def delete_query
      query = Query.find(params[:id])
      query.destroy
      flash.now[:notice]=I18n.t(:query_destroyed)
      flash.keep
      redirect_to :back
    end
end