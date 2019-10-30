require 'rails_helper'

RSpec.describe Franchise, type: :model do 
  let!(:glass)    {create :franchise, lastname: "Glass", firstname: "Forrest"}
  let!(:kittle)   {create :franchise, lastname: "Kittle", firstname: "Theresa"}
  let!(:hull)     {create :franchise, lastname: "Hull", firstname: "Scott"}
  let!(:williams) {create :franchise, lastname: "Williams", firstname: "Dan"}
  let!(:canata)   {create :franchise, :not_compliant,  lastname: "Canata", firstname: "Dennis"}

  describe "Test Model validations" do 
	  #Testing validity of the factory
	  it "has a valid factory" do 
	    expect(build(:franchise)).to be_valid
    end

    #Test validation of missing values that dont allow null
	  it "is invalid without area" do 
      
  	  expect(build(:franchise, area: nil )).not_to be_valid
  	end

	  it "is invalid without master" do 
	    expect(build(:franchise, mast: nil )).not_to be_valid
	  end
	 
	  it "is invalid without region" do  
	    expect(build(:franchise, region: nil )).not_to be_valid
	  end

	  it "is invalid without office" do  
	    expect(build(:franchise, office: nil )).not_to be_valid
	  end

    it "is invalid without franchise" do  
      expect(build(:franchise, franchise_number: nil )).not_to be_valid
    end

	  it "is invalid without lastname" do  
	    expect(build(:franchise, lastname: nil )).not_to be_valid
	  end 

  	it "is invalid without firstname" do  
  	  expect(build(:franchise, firstname: nil )).not_to be_valid	
    end
  		
    it "is invalid without email" do  
      expect(build(:franchise, email: nil )).not_to be_valid  
    end	

    it "is invalid without proper email format" do 
      expect(build(:franchise, email: "patof.com")).not_to be_valid
    end

    it "is invalid without phone" do  
      expect(build(:franchise, phone: nil )).not_to be_valid  
    end 

    it "is invalid without start_date" do  
      expect(build(:franchise, start_date: nil )).not_to be_valid  
    end 

    it "is invalid without address" do  
      expect(build(:franchise, address: nil )).not_to be_valid  
    end 

    it "is invalid without city" do  
      expect(build(:franchise, city: nil )).not_to be_valid  
    end 

    it "is invalid without state" do  
      expect(build(:franchise, state: nil )).not_to be_valid  
    end 

    it "is invalid without zip" do  
      expect(build(:franchise, zip_code: nil )).not_to be_valid  
    end 

  	#Test the several validate_presence and numericality 	
  	it "is invalid if prior year rebate is less than zero" do
  	  expect(build(:franchise, prior_year_rebate: -1)).not_to be_valid
  	end

  	it "is invalid if advanced rebate is less than zero" do
  	  expect(build(:franchise, advanced_rebate: -1)).not_to be_valid
  	end

    it "does not accept duplicate franchise" do 
      expect(build(:franchise, franchise_number: glass.franchise_number)).not_to be_valid
    end
  end

  describe "Test the instance methods" do 
    describe "#fullname" do 
      it "should return the proper fullname" do 
        expect(glass.full_name).to eq([glass.firstname,glass.lastname].join(" "))
      end
    end

    describe "#number_and_name" do 
      it "should return the proper number and name" do 
        expect(glass.number_and_name).to eq([glass.franchise_number, glass.lastname, glass.firstname].join(" "))
      end
    end

    describe "#dropdown_list" do 
      it "should return the proper dropdown list format" do 
        expect(glass.dropdown_list).to eq([glass.lastname, glass.firstname,"(#{glass.franchise_number})"].join(" "))
      end
    end

    describe "#full_denomination" do
      it "should return the proper full denomination" do
        expect(glass.full_denomination).to eq([glass.franchise_number,glass.lastname].join(" "))
      end
    end

    describe "#name_has_changed?" do
      it "should return false when the name does not change" do 
        expect(glass.name_has_changed?).to eq(false)
      end
      it "should return true when the name changes" do 
        glass.firstname = "Maurice"
        expect(glass.name_has_changed?).to eq(true)
      end
    end
  end

  describe "testing the after_create callback" do 
    it "should add a notice for signing up" do 
      new_franchise = build(:franchise)
      expect{new_franchise.save}.to change{EventLog.count}.by(1)
    end
  end

end