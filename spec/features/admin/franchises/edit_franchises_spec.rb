require 'rails_helper'

RSpec.feature "Edit Franchises", :type => :feature do 
  let!(:admin) {create(:admin)}	
  let!(:franchises) {create_list(:franchise, 10)}
  

  scenario "Can edit one specific franchise" do 
    visit '/'
    simulate_admin_sign_in(admin)
    visit admins_franchises_path
    within("table#franchise-list") do
      first(".edit-link").click
    end
    
    expect(page).to have_field("franchise_lastname", with: franchises.first.lastname)
    expect(page).to_not have_field("franchise_firstname", with: franchises.last.firstname)
  end

  scenario "Can change data of one specific franchise" do 
    visit '/'
    simulate_admin_sign_in(admin)
    visit admins_franchises_path
    within("table#franchise-list") do
      first(".edit-link").click
    end
    
    expect(page).to have_field("franchise_lastname", with: franchises.first.lastname)
    fill_in 'franchise_lastname', with: "NewValue"
    click_button 'Save Changes'
    expect(page).to have_content("NewValue")
  end


end
