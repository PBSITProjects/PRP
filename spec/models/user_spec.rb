require 'rails_helper'

RSpec.describe User, type: :model do 
  let!(:franchise) {create :franchise}
  let!(:franchise2) {create :franchise, :show_exempt }
  let!(:user) {create :user, franchise: franchise}
  let!(:user2) {create :user, franchise: franchise2}
  let!(:employee){create :user, :data_entry_only ,franchise: franchise }
  let!(:can_pay){create :user, :user_can_pay ,franchise: franchise}

  describe "Testing model validations" do 
    it "has a valid user factory" do 
      expect(user).to be_valid
    end

    it "has a valid employee factory" do 
      expect(employee).to be_valid
    end

    it "has a valid can_pay user factory" do 
      expect(can_pay).to be_valid
    end

    it "is invalid without an email" do 
      expect(build(:user, email: nil)).not_to be_valid
    end

    it "is invalid without a password" do 
      expect(build(:user, password: nil)).not_to be_valid
    end

    it "is invalid without a franchise" do 
      expect(build(:user, franchise: nil)).not_to be_valid
    end

    it "does not allow a duplicate email" do 
      expect(build(:user, email: user.email)).not_to be_valid
    end
  end

  describe "testing the after_create callback" do 
    let (:new_franchise) {create (:franchise)}
    it "should add a notice for signing up" do 
      new_user = build(:user, franchise: new_franchise)
      expect{new_user.save}.to change{EventLog.count}.by(1)
    end
  end

  describe "Testing Scopes" do 
    describe "Testing franchise_users" do 
      it "should return the proper count of users" do 
        expect(User.franchise_users(franchise.id).size).to eq(3)
      end

      it "should return the proper users" do 
        expect(User.franchise_users(franchise.id)).to include(user,employee,can_pay)
      end
    end
  end

  describe "Instance Methods" do 

    describe "Testing show_excluded?" do 
      it "should return false for user tied to franchise hiding exempt collections" do 
        expect(user.show_excluded?).to eq(false)
      end

      it "should return true for user tied to franchise showing exempt collections" do 
        expect(user2.show_excluded?).to eq(true)
      end
    end
  end

end

