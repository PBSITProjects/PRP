require "rails_helper"

RSpec.describe "Franchises Requests", :type => :request do 
  #Create a user and a property tied to that user
  let!(:admin) {create(:admin)} 
  let!(:glass)    {create :franchise, lastname: "Glass", firstname: "Forrest"}
  let!(:kittle)   {create :franchise, lastname: "Kittle", firstname: "Theresa"}
  let!(:hull)     {create :franchise, lastname: "Hull", firstname: "Scott"}

  #Tests to access the different enpoints while user not signed in
  describe 'Admin Not Signed In' do 
    
    describe 'GET #index' do
      subject { get admins_franchises_path} 
    
      it "returns an unsuccessful response" do 
  	    subject
  	    expect(response).to_not be_successful
  	  end
      
      it "redirects to sign in page" do 
        subject
        expect(response).to redirect_to (new_admin_session_path)
      end
    end

    describe 'GET #show' do
      
      subject { get admins_franchise_path glass}
      
      it "returns an unsuccessful response" do 
        subject
        expect(response).to_not be_successful
      end

      it "redirects to sign in page" do 
        
        expect(subject).to redirect_to (new_admin_session_path)
      end
    end

    describe 'GET #new' do
      
      subject {get new_admins_franchise_path}

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
      
      subject {get edit_admins_franchise_path glass} 

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
      
      subject {patch admins_franchise_path glass, params: {franchise: attributes_for(:franchise,  lastname: "New Lastname")}}

      it "does not update the record in the database" do 
        subject
        expect(glass.reload.lastname).to_not eq "New Lastname"
      end

      it "redirects to sign in page" do 
        subject
        expect(response).to redirect_to (new_admin_session_path)
      end
    end


    describe "POST #create" do
      
      subject {post admins_franchises_path, params: {franchise: FactoryBot.attributes_for(:franchise) }} 
 
      it "does not change the number of Franchises" do 
        expect {subject}.to_not change {Franchise.count}
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
        get admins_franchises_path
        expect(response).to be_successful
      end
    end

    describe 'GET #show' do 
      it "returns a successful response" do 
        get admins_franchise_path glass
        expect(response).to be_successful
      end

    end

    describe 'GET #new' do
      it "returns a successful response" do 
        get new_admins_franchise_path
        expect(response).to be_successful
      end
    end

    describe 'GET #edit' do 
      it "returns a successful response" do 
        get edit_admins_franchise_path glass
        expect(response).to be_successful
      end
    end
    describe "PATCH #update" do 
      context "with valid attributes" do 
        let(:changed_attributes) {glass.attributes.symbolize_keys.merge(lastname: "New Lastname", start_date:'01/01/2019', renew_date: '01/01/2024' )}
   
        subject {patch admins_franchise_path glass, params: {franchise: changed_attributes }}

        it "updates the record in the database" do 
          subject
          expect(glass.reload.lastname).to eq "New Lastname"
        end

        it "redirects to franchises index" do 
          subject
          expect(response).to redirect_to admins_franchises_path
        end
      end

      context "with invalid attributes" do
        let(:changed_attributes) {glass.attributes.symbolize_keys.merge(lastname: nil, start_date:'01/01/2019', renew_date: '01/01/2024' )}
        subject {patch admins_franchise_path glass, params: {franchise: changed_attributes}}

        it "does not updates the record in the database" do 
          subject
          expect(glass.reload.lastname).to_not eq nil
        end

        it "returns a successful response" do 
          subject
          expect(response).to be_successful
        end
      end
    end

    describe 'POST #create' do 
      
      context "with valid attributes" do
        
        subject {post admins_franchises_path,params: {franchise: FactoryBot.attributes_for(:franchise, start_date: '01/01/2019', renew_date: '01/01/2024') }} 
 
        it "creates a Property in the database" do 
          expect {subject}.to change {Franchise.count}.by(1)
        end  

        it "redirects to admin franchises index" do 
          subject
          expect(response).to redirect_to admins_franchises_path
        end
      end

      context "with invalid attributes" do
        
        subject {post admins_franchises_path,params: {franchise: FactoryBot.attributes_for(:franchise, lastname: nil, start_date: '01/01/2019', renew_date: '01/01/2024') }} 
 
        it "does not creates a Franchise in the database" do 
          expect {subject}.not_to change {Franchise.count}
        end  

        it "returns a successful response" do 
          subject
          expect(response).to be_successful
        end 
      end
    end
  end

  describe "Admin don't have access to user pages" do 

    describe 'GET #edit' do
      subject {get edit_franchise_path glass} 

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