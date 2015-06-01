module BHL
  module Login
    def log_in(user)
      session[:user_id] = user.id
      session[:active] = user.active
      session[:real_name] = user.real_name
      session[:guid] = user.guid
      
      user.last_login = Time.now
      user.save
      #cookies[:SSid] = user.guid

      cookies[:SSid] = {
        :value => user.guid,
        :domain => 'bhl.bibalex.org'
      }  
    end
    
    def is_loggged_in?
      session[:user_id].nil? ? false : true
    end
    
    def log_out
      session.clear
      #cookies.delete :SSid
      cookies.delete :SSid, :domain => 'bhl.bibalex.org'
    end
  end
end
