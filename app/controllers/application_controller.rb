class ApplicationController < ActionController::Base
  before_action :prepare_exception_notifier
  
  #Make sure we add the current user information when an
  #Exception happens
  def prepare_exception_notifier
  	if current_user
    request.env["exception_notifier.exception_data"] = 
    {current_user: current_user }
    end 

    if current_admin
    request.env["exception_notifier.exception_data"] = 
    {current_admin: current_admin}
   end
  end


end
