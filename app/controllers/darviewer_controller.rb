class DarviewerController < ApplicationController
  def user
    guid = params[:SSOToken]
    validate = false
    session[:active] = 1
    session[:guid] = "123"
    
    if(guid != nil && guid == session[:guid] && session[:active] == 1)  
      validate = true       
    end
    @json = "#{params[:callback]}({'Valid':[#{validate}]});"
    render layout: 'darviewer'
  end
  
  def book
    
  end
end
