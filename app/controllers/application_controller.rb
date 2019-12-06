class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :pass_locale_js
  before_action :prepare_exception_notifier
  rescue_from CanCan::AccessDenied,with: :access_error 
  
  def current_ability
    @current_ability ||= current_admin ? AdminAbility.new(current_admin) : UserAbility.new(current_user)  
  end
    

  private
  #Make sure we add the current user information when an
  #Exception happens
  def access_error(exception)
    flash[:warning] = exception.message
    redirect_to root_path
  end
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
 
  def set_locale
    I18n.locale = 'en'
  end

  def pass_locale_js
    gon.I18n = I18n.locale
  end 

end
