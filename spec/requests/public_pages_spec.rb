require "rails_helper"


RSpec.describe "Public Pages", :type => :request do 
  
  describe 'User Not Signed In' do 
    describe 'GET #root' do 
      it "returns a successful response" do 
  	    get root_path
  	    expect(response).to be_successful
  	  end

  	  it "shows the login info" do 
  	    get root_path
  	    expect(response.body).to include("Welcome, Please Sign In")	
  	  end
    end
    
  end  

  describe 'User Signed In' do 
    before do 
      user = create(:user)
      sign_in user
    end
    describe 'GET #root' do 
      it "returns a successful response" do 
        get root_path
        expect(response).to be_successful
      end
      it "does not show the login info" do 
        get root_path
        expect(response.body).to_not include("Welcome, Please Sign In") 
      end

      it "shows the proper menu" do 
        get root_path
        expect(response.body).to include("Account") 
      end

      it "shows the proper content" do 
        get root_path
        expect(response.body).to include("Public#userpage")
      end
    end

  end

  describe 'Admin Signed In' do 
    before do 
      admin = create(:admin)
      sign_in admin
    end
    describe 'GET #root' do 
      it "returns a successful response" do 
        get root_path
        expect(response).to be_successful
      end
      it "does not show the login info" do 
        get root_path
        expect(response.body).to_not include("Welcome, Please Sign In") 
      end

      it "shows the proper menu" do 
        get root_path
        expect(response.body).to include("Franchises") 
      end

      it "shows the proper content" do 
        get root_path
        expect(response.body).to include("Public#adminpage")
      end
    end

  end

end