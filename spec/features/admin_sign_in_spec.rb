require 'rails_helper'

RSpec.feature "Admin Log In", :type => :feature do
  let!(:admin) {create(:admin)}  
  scenario "From Admin Log In page with valid Info" do
    visit root_path
    click_link 'Admin'
    expect(page).to have_content("Admin Log In")
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button 'Log In'
    expect(page).to have_link("Sign Out")
    expect(page).to_not have_selector "img#padgett-logo"
    expect(page).to have_content("Public#adminpage")
    
  end

  

  scenario "Admin Log In Page with Invalid Email" do
    visit root_path
    click_link 'Admin'
    expect(page).to have_content "Admin Log In"
    expect(page).to have_button("Log In")
    fill_in "Email", with: "aa"
    fill_in "Password", with: "password"
    click_button 'Log In'
    expect(page).to have_content "Invalid Email or password."
    expect(page).to have_button "Log In"
  end

  scenario "Admin Log In Page With Non-Existent Email" do
    visit root_path
    click_link 'Admin'
    expect(page).to have_content("Admin Log In")
    expect(page).to have_button("Log In")
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_button 'Log In'
    expect(page).to have_content "Invalid Email or password."
    expect(page).to have_button "Log In"
  end

  scenario "Log In Page With Invalid Password" do
    visit root_path
    click_link 'Admin'
    expect(page).to have_content("Admin Log In")
    expect(page).to have_button("Log In")
    fill_in "Email", with: admin.email
    fill_in "Password", with: "wrong"
    click_button 'Log In'
    expect(page).to have_content "Invalid Email or password."
    expect(page).to have_button "Log In"
  end

end