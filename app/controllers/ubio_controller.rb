class UbioController < ApplicationController
  def index
    status = params[:status] != nil ? params[:status] : '' 
    query = ''
    @fail = false
    case status
    when 'done'
      query = ' ubio_in_dar_fail=0 '
    when 'fail'
      query = ' ubio_in_dar_fail>0 '
    when 'pending'
      query = ' ubio_in_dar_fail IS NULL '
    else
      @fail = true
    end
    if !@fail
      volumes =  Volume.find(:all, :select => 'job_id' ,:conditions => ["get_pages_names_fail IS NULL AND #{query}"])
      @jobs = []
      volumes.each do |item|
        @jobs << item.job_id
      end
      
      j = ActiveSupport::JSON
      @json = j.encode({ :jobids => @jobs })
    end
    render layout: 'ubio'
  end
  def show
  end
end
