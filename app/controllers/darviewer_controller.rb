class DarviewerController < ApplicationController
  include SolrHelper
  include DarviewerHelper
  def user
    guid = params[:SSOToken]
    validate = false
    
    if(guid != nil && guid == cookies[:SSid].to_s)  #ask why session[:active] is not read
      validate = true       
    end
    @json = "#{params[:callback]}({'Valid':[#{validate}]});"
    #render layout: 'darviewer'
  end
  
  def book
    pid = params[:PID]
    jobid = pid.gsub("DAF-Job:", "")
    volume = Volume::find_by_job_id(jobid)
    
    bookdata = solr_search("vol_jobid:#{volume.job_id}", "bok_title, author, subject, bok_start_date, bok_start_date, bok_language, author")
    if(bookdata != nil)
      jsonArray = {
        :Subject => bookdata['subject'] != nil ? bookdata['subject'] : "", 
        :PublicationDate => bookdata['bok_start_date'] != nil  ? bookdata['bok_start_date'] : "",
        :Project => 'Biodiversity Heritage Library',
        :Language => bookdata['bok_language'] != nil  ? bookdata['bok_language'] : "",
        :Authors => bookdata['author'] != nil ? bookdata['author'] : "",
        :Title => bookdata['bok_title'] != nil ? bookdata['bok_title'][0] : ""
      }
    end
    @json = params[:callback] + "(" + jsonArray.to_json  + ");"
    
  end
  
  def annotations
    @json = ""
    @jsonArray = {}
    
    case params[:callback] 
    when "getAnnotations"
      jsonArray = get_annotations(params)
    when "saveNote", "saveHighlight", "saveMyBasket"
      jsonArray = save_annotation(params)
    when "editNote", "editMyBasket"
      jsonArray = edit_annotation(params)
    when "removeNote", "removeHighlight", "removeMyBasket"
      jsonArray = remove_annotation(params)
    end
    j = ActiveSupport::JSON
    @json = params[:callback] + "(" + j.encode(jsonArray)  + ")"  
  end
end