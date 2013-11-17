module UsersHelper
  def logged_in?
    session[:user_id].nil? ? false : true
  end
  
  def set_view(params, view)
    params[:controller] = nil
    params[:action] = nil
    tmp_params = params.clone
    tmp_params[:view] = view
    tmp_params
  end
end
