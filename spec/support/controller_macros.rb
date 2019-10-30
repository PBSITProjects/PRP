module ControllerMacros
  #def login_user
  #  before (:each) do 
	#  @request.env["devise.mapping"] = Devise.mappings[:user]
	#  user = FactoryGirl.create(:user)
	#  sign_in user
	#  end
  #end
  

  # def login_admin
  # 	before (:each) do
  # 		@request.env["devise.mapping"] = Devise.mappings[:user]
  # 		user = FactoryGirl.create(:adminuser)
  # 		sign_in user
  # 	end
   #end


	#def login_invalid
  #		before (:each) do 
	#		@request.env["devise.mapping"] = Devise.mappings[:user]
	#		user = FactoryGirl.create(:user, password: "blablabla")
	#		sign_in user
	#	end
	#end

  #def select_date(date, options = {})
  #  field = options[:from]
  #  select date.strftime('%Y'), :from => "#{field}_1i" #year
  #  select date.strftime('%B'), :from => "#{field}_2i" #month
  #  select date.strftime('%d'), :from => "#{field}_3i" #day 
#end

end
