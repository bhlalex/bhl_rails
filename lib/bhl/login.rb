module BHL
  module Login
    def log_in(user)
      session[:user_id] = user.id
      session[:active] = user.active
      session[:real_name] = user.real_name
      session[:guid] = user.guid
      
      user.last_login = Time.now
      user.save
    end
    
    def is_loggged_in?
      session[:user_id].nil? ? false : true
    end
    
    def log_out
      session.clear
    end
  end
end