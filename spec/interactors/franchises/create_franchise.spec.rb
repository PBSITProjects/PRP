require "rails_helper"

RSpec.describe "Interactor - CreateFranchise", :type => :interactor do 
	let!(:admin) {create(:admin)}
	let!(:params) {FactoryBot.attributes_for(:franchise, start_date: '01/01/2019', renew_date: '01/01/2024')}

	describe ".call" do 
		context "When given valid attributes" do 
			subject {CreateFranchise.call(params: params, user: admin)}
			it "should create franchise" do 
				interactor = subject
				expect(interactor).to be_a_success
				expect(interactor.franchise).to eq(Franchise.last)
			end

			it "should log an event" do 
				expect{subject}.to change{EventLog.count}.by(1)
			end

		end

		context "When given invalid attributes" do 
			subject {CreateFranchise.call(params: params.merge(lastname: nil), user: admin)}
			it "should not create franchise" do 
				interactor = subject
				expect(interactor).to be_a_failure
			end

			it "should not log an event" do 
				expect{subject}.to_not change{EventLog.count}
			end

		end
	end

end