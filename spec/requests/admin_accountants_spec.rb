require "rails_helper"

RSpec.describe "Admin Accountants Requests", :type => :request do 
  #Create a user and a property tied to that user
  let!(:admin) {create(:admin)} 
  let!(:glass)    {create :franchise, lastname: "Glass", firstname: "Forrest"}
  let!(:glass_accountant) {create :accountant, franchise: glass, lastname: "Glass", firstname: "Forrest"}
  let!(:kittle)   {create :franchise, lastname: "Kittle", firstname: "Theresa"}
  let!(:kittle_accountant) {create :accountant, franchise: kittle, lastname: "Kittle", firstname: "Theresa"}

  #Tests to access the different enpoints while user not signed in
  describe 'Admin Not Signed In' do 
    
    describe 'GET #index' do
      subject { get admins_accountants_path} 
    
      it "returns an unsuccessful response" do 
  	    subject
  	    expect(response).to_not be_successful
  	  end
      
      it "redirects to sign in page" do 
        subject
        expect(response).to redirect_to (new_admin_session_path)
      end
    end

    

    describe 'GET #new' do
      
      subject {get new_admins_accountant_path}

      it "returns an unsuccessful response" do 
        subject
        expect(response).to_not be_successful
      end

      it "redirects to sign in page" do 
        subject
        expect(response).to redirect_to (new_admin_session_path)
      end
    end

    describe 'GET #edit' do
      
      subject {get edit_admins_accountant_path glass_accountant} 

      it "returns an unsuccessful response" do 
        subject
        expect(response).to_not be_successful
      end

      it "redirects to sign in page" do 
        subject
        expect(response).to redirect_to (new_admin_session_path)
      end
    end
    
    describe "PATCH #update" do 
      
      subject {patch admins_accountant_path glass_accountant, params: {accountant: attributes_for(:accountant, franchise: glass,  lastname: "New Lastname")}}

      it "does not update the record in the database" do 
        subject
        expect(glass_accountant.reload.lastname).to_not eq "New Lastname"
      end

      it "redirects to sign in page" do 
        subject
        expect(response).to redirect_to (new_admin_session_path)
      end
    end


    describe "POST #create" do
      
      subject {post admins_accountants_path, params: {accountant: FactoryBot.attributes_for(:accountant) }} 
 
      it "does not change the number of Accountants" do 
        expect {subject}.to_not change {Accountant.count}
      end

      it "redirects to sign in page" do 
        subject
        expect(response).to redirect_to (new_admin_session_path)
      end
    end

    
  end  

  #Tests to access the different enpoints while used signed in
  describe 'Admin Signed In' do 
    before do 
      sign_in admin
    end
    
    describe 'GET #index' do 
      it "returns a successful response" do 
        get admins_accountants_path
        expect(response).to be_successful
      end
    end

    

    describe 'GET #new' do
      it "returns a successful response" do 
        get new_admins_accountant_path({franchise_id: glass.id})
        expect(response).to be_successful
      end
    end

    describe 'GET #edit' do 
      it "returns a successful response" do 
        get edit_admins_accountant_path glass_accountant
        expect(response).to be_successful
      end
    end
    describe "PATCH #update" do 
      context "with valid attributes" do 
        let(:changed_attributes) {glass_accountant.attributes.symbolize_keys.merge(lastname: "New Lastname", start_date: nil, birthdate: nil, spouse_birthdate: nil )}
   
        subject {patch admins_accountant_path glass_accountant, params: {accountant: changed_attributes }}

        it "updates the record in the database" do 
          subject
          expect(glass_accountant.reload.lastname).to eq "New Lastname"
        end

        it "redirects to Accountants index" do 
          subject
          expect(response).to redirect_to admins_accountants_path
        end
      end

      context "with invalid attributes" do
        let(:changed_attributes) {glass_accountant.attributes.symbolize_keys.merge(lastname: nil, start_date: nil, birthdate: nil, spouse_birthdate: nil )}
        subject {patch admins_accountant_path glass_accountant, params: {accountant: changed_attributes}}

        it "does not updates the record in the database" do 
          subject
          expect(glass_accountant.reload.lastname).to_not eq nil
        end

        it "returns a successful response" do 
          subject
          expect(response).to be_successful
        end
      end
    end

    describe 'POST #create' do 
      
      context "with valid attributes" do
        
        subject {post admins_accountants_path,params: {accountant: FactoryBot.attributes_for(:accountant, start_date: nil, birthdate: nil, spouse_birthdate: nil, franchise_id: glass.id) }} 
 
        it "creates an Accountant in the database" do 
          expect {subject}.to change {Accountant.count}.by(1)
        end  

        it "redirects to admin accountants index" do 
          subject
          expect(response).to redirect_to admins_accountants_path
        end
      end

      context "with invalid attributes" do
        
        subject {post admins_accountants_path,params: {accountant: FactoryBot.attributes_for(:accountant, lastname: nil, start_date: nil, birthdate: nil, spouse_birthdate: nil, franchise_id: glass.id) }} 
 
        it "does not creates an Accountant in the database" do 
          expect {subject}.not_to change {Accountant.count}
        end  

        it "returns a successful response" do 
          subject
          expect(response).to be_successful
        end 
      end
    end
  end

  describe "Admin don't have access to user pages" do 

    describe 'GET #show' do
      subject {get accountant_path glass} 

      it "returns an unsuccessful response" do 
        subject
        expect(response).to_not be_successful
      end

      it "redirects to sign in page" do 
        subject
        expect(response).to redirect_to (new_user_session_path)
      end
    end


  end
 
end