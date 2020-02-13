require 'rails_helper'

RSpec.feature "View Franchises", :type => :feature do 
  let!(:admin) {create(:admin)}	
  data = [{firstname: "AAAA", lastname: "BBBB"},{firstname: "BBBB", lastname: "AAAA"}, {firstname: "AAAB", lastname: "BBBA"} ]
  let!(:franchises) {data.map {|d| create(:franchise, d)}}
  
  scenario "Can view all Franchises" do 
    #admin =  create(:admin)
    #data = [{firstname: "AAAA", lastname: "BBBB"},{firstname: "BBBB", lastname: "AAAA"}, {firstname: "AAAB", lastname: "BBBA"} ]
    #franchises =  data.map {|d| create(:franchise, d)}
    visit '/'
    simulate_admin_sign_in(admin)
    visit admins_franchises_path
    franchises.each do |fr|
      expect(page).to have_content(fr.full_name)
    end
  
  end

  scenario "Can filter franchises", js: true  do 
    visit '/'
    simulate_admin_sign_in(admin)
    visit admins_franchises_path
    expect(page).to have_button("Create Franchise")
    fill_in "search", with: "A"
    franchises.each do |fr|
      expect(page).to have_content(fr.full_name)
    end
    fill_in "search", with: "AAA"
    franchises.each do |fr|
      expect(page).to have_content(fr.full_name)
    end
    fill_in "search", with: "AAAB"
    expect(page).to have_content(franchises.last.full_name)
    expect(page).to_not have_content(franchises.first.full_name)
  
  end

  scenario "Can view one specific franchise" do 
    visit '/'
    simulate_admin_sign_in(admin)
    visit admins_franchises_path
    within("table#franchise-list") do
      first(".show-link").click
    end
    
    expect(page).to have_content(franchises.first.firstname)
    expect(page).to have_content(franchises.first.lastname)
    expect(page).to have_content(franchises.first.address)
    expect(page).to have_content(franchises.first.email)
    expect(page).to_not have_content(franchises.last.firstname)
  end


end
