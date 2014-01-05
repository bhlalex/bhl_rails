class ActivitiesController < ApplicationController
  include ActivitiesHelper
  def index
    param = params[:sort] ? params[:sort].split(" ") : ["all", "desc"]
    @sort_filter = params[:sort] ? params[:sort] : "all desc"
    @filter = param[0]
    @sort = param[1]
    
    @page_title = I18n.t(:activities_index_title)
    @total_number = get_activities_count(@filter) 
    @page = params[:page] ? params[:page].to_i : 1
    @lastPage = @total_number[0][:count] ? ((@total_number[0][:count]).to_f/PAGE_SIZE).ceil : 0
    offset = (@page > 1) ? (@page - 1) * PAGE_SIZE : 0
    @activities = get_activities(@filter, @sort, offset, PAGE_SIZE) 
    @url_params = params.clone
  end
end