require 'rails_helper'

RSpec.describe Accountant, type: :model do 
  let!(:glass)    {create :franchise, lastname: "Glass", firstname: "Forrest"}
  let!(:kittle)   {create :franchise, lastname: "Kittle", firstname: "Theresa"}
  let!(:glass_accountant) {create :accountant, lastname: "Glass", firstname: "Forrest", franchise: glass }
  let!(:kittle_accountant) {create :accountant, lastname: "Kittle", firstname: "Theresa", franchise: kittle }

  describe "Test Model validations" do 
	  #Testing validity of the factory
	  it "has a valid factory" do 
	    expect(build(:accountant)).to be_valid
    end

	  it "is invalid without lastname" do  
	    expect(build(:accountant, lastname: nil )).not_to be_valid
	  end 

  	it "is invalid without firstname" do  
  	  expect(build(:accountant, firstname: nil )).not_to be_valid	
    end

    it "does not accept duplicate accounant number for same franchise" do 
      expect(build(:accountant, franchise: glass, accountant_num: glass_accountant.accountant_num)).not_to be_valid
    end

    it "does accept duplicate accountant number for another franchise" do 
      expect(build(:accountant, franchise: glass, accountant_num: glass_accountant.accountant_num+'0')).to be_valid
    end 

    it "is invalid without a franchise" do
      expect(build(:accountant, franchise: nil)).not_to be_valid
    end
  end

  describe "Test the instance methods" do
    describe "#fullname" do 
      it "should return the proper fullname" do 
        expect(glass_accountant.full_name).to eq([glass_accountant.firstname,glass_accountant.lastname].join(" "))
      end
    end
  end

end