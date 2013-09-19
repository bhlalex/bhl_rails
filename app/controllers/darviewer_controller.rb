class DarviewerController < ApplicationController
  include SolrHelper
  def user
    guid = params[:SSOToken]
    validate = false
    session[:active] = 1
    session[:guid] = "123"
    
    if(guid != nil && guid == session[:guid] && session[:active] == 1)  
      validate = true       
    end
    @json = "#{params[:callback]}({'Valid':[#{validate}]});"
    #render layout: 'darviewer'
  end
  
  def book
    session[:active] = 1
    session[:guid] = "123"
    
    pid = params[:PID]
    jobid = pid.gsub("DAF-Job:", "")
    volume = Volume::find_by_job_id(jobid)
    
    bookdata = solr_search("vol_jobid:#{volume.job_id}", "bok_title, author, subject, bok_start_date, published_at, bok_language, author")
    if(bookdata != nil)
      jsonArray = {
        'Subject' => bookdata['subject'] != nil ? bookdata['subject'] : "", 
        'PublicationDate' => bookdata['bok_start_date'] != nil ? bookdata['bok_start_date'] : "",
        'Project' => 'Biodiversity Heritage Library',
        'Language' => bookdata['bok_language'] != nil ? bookdata['bok_language'] : "",
        'Authors' => bookdata['author'] != nil ? bookdata['author'] : "",
        'Title' => bookdata['bok_title'] != nil ? bookdata['bok_title'] : ""
      }
    end
    j = ActiveSupport::JSON
    @json = params[:callback] + "(" + j.encode(jsonArray)  + ")"
  end
end
