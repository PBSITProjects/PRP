class SignupsController < ApplicationController
  include CustomValidations
    
  def index
    
  end
    
  #This is the code that authorizes the user based on the email entered 
  def create
    tmp_mail = params[:email]   
     
    #Validate basic format of the email
    if email_valid?(tmp_mail) == false
      flash[:warning] = "Invalid email address. Please enter an email address using the proper format"
      redirect_to signup_path
    else
      #Search for the email in our user table
      f = Franchise.find_by email: tmp_mail
      if f.nil? 
        #If it's not there, we still send a "fake" successful message
        flash[:warning] = "An account was not found with this email. Please verify with Home Office to find out which email is on file for your account"
        redirect_to root_url
      else
        user =  User.find_by email: f.email

        if user.nil?
          temp_password = SecureRandom.hex(10)
          new_user =  User.create(email: f.email, password:  temp_password, password_confirmation: temp_password, franchise_id: f.id)
          #If it's there, we invoke the reset_pass method, which calls the reset password option and notify them
          new_user.reset_pass
          flash[:success] = "Thank you. An email was sent to "+new_user.email + " with instructions to choose your password."
          redirect_to root_url
        else
          flash[:warning]     = "This email address was alread used to sign up on this site. Click the Log In button to access the site or click on Forgot your password?"
          redirect_to root_url
        end
      end
    end
  end
end