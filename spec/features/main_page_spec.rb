require 'rails_helper'

RSpec.feature "Home Page", :type => :feature do
  let!(:user) {create(:user)}
  let!(:admin) {create(:admin)}

  scenario "When Not Logged In" do
    visit "/"
    expect(page).to have_css("img#padgett-logo")
    expect(page).to have_content("Report + Pay")
    expect(page).to have_content("Welcome, Please Sign In")
  end

  scenario "When Logged In As User" do 
  	visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  	visit "/"
  	expect(page).to_not have_selector "img#padgett-logo"
    expect(page).to have_link("Sign Out")
    expect(page).to have_content("Public#userpage")
    
  end

  scenario "When Logged In As Admin " do 
    visit new_admin_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log In'
    expect(page).to_not have_selector "img#padgett-logo"
    expect(page).to have_link("Sign Out")
    expect(page).to have_content("Public#adminpage")

  end

end