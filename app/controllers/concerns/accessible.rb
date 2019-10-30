#This concern is to make sure that a logged in Admin cannot
#access the user sign in page and vice versa.
#Doing so would mess up the authenticity tokens

module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  #If a user or admin is already logged in and they try to access
  #the sign in page of another user type, we simply redirect
  #them to their corresponding root page 
  def check_user
    if current_admin
      flash.clear
      redirect_to(authenticated_admin_path) && return
    elsif current_user
      flash.clear
      redirect_to(authenticated_user_path) && return
    end
  end
end