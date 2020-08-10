class ApplicationController < ActionController::Base
 
 after_action :store_action
 def store_action
  return unless request.get?
  if (request.path!="/users/sign_in" && request.path!="/users/sign_up" &&request.path!="/users/password/new" &&
    request.path!="/users/password/edit" && request.path!="/users/sign_out" && !request.xhr?)
    session[:previous_url]=request.fullpath
  end
end
def after_sign_in_path_for(resource)
  previous_path=session[:previous_url]
  session[:previous_url] = nil
  previous_path || root_path
end
end
