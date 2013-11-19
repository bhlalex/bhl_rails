class UserSearchHistoryController < ApplicationController
    def save_query
      query = Query.new(:user_id => params[:user_id].to_i, :string => params[:query])
      query.save
      flash[:success] = "Query saved"
      flash.keep
      redirect_to :back
    end
  
    def delete_query
      query = Query.find(params[:id])
      query.destroy
      flash[:success]="Query destroyed"
      flash.keep
      redirect_to :back
    end
end
