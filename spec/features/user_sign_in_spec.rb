require 'rails_helper'

RSpec.feature "User Log In", :type => :feature do
  let!(:user) {create(:user)}  
  scenario "From Home Page with Valid Info" do
    visit root_path
    expect(page).to have_button("Log In")
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button 'Log In'
    expect(page).to have_link("Sign Out")
    expect(page).to_not have_selector "img#padgett-logo"
    expect(page).to have_content("Public#userpage")
    
  end

  scenario "Home Page with Invalid Email", js: true do
    visit root_path
    expect(page).to have_button("Log In")
    fill_in "Email", with: "aaa"
    fill_in "Password", with: "password"
    click_button 'Log In'
    expect(page).to have_button("Log In")
    expect(page).to have_content("Welcome")
    expect(page).to have_selector "img#padgett-logo"
  end

  scenario "Home Page with Non-Existent Email" do
    visit root_path
    expect(page).to have_button("Log In")
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_button 'Log In'
    expect(page).to have_content "Invalid Email or password."
    expect(page).to have_button "Log In"
    expect(page).to_not have_selector "img#padgett-logo"
  end

  scenario "Home Page With Invalid Password" do
    visit root_path
    expect(page).to have_button("Log In")
    fill_in "Email", with: user.email
    fill_in "Password", with: "wrong"
    click_button 'Log In'
    expect(page).to have_content "Invalid Email or password."
    expect(page).to have_button "Log In"
    expect(page).to_not have_selector "img#padgett-logo"
  end

  scenario "Log In Page with Valid Info" do
    visit new_user_session_path
    expect(page).to have_content "Log In"
    expect(page).to have_button "Log In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button 'Log In'
    expect(page).to have_link("Sign Out")
    expect(page).to_not have_selector "img#padgett-logo"
    expect(page).to have_content("Public#userpage")
  end

  scenario "Log In Page with Invalid Email" do
    visit new_user_session_path
    expect(page).to have_content "Log In"
    expect(page).to have_button("Log In")
    fill_in "Email", with: "aa"
    fill_in "Password", with: "password"
    click_button 'Log In'
    expect(page).to have_content "Invalid Email or password."
    expect(page).to have_button "Log In"
  end

  scenario "Log In Page With Non-Existent Email" do
    visit new_user_session_path
    expect(page).to have_button("Log In")
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_button 'Log In'
    expect(page).to have_content "Invalid Email or password."
    expect(page).to have_button "Log In"
  end

  scenario "Log In Page With Invalid Password" do
    visit new_user_session_path
    expect(page).to have_button("Log In")
    fill_in "Email", with: user.email
    fill_in "Password", with: "wrong"
    click_button 'Log In'
    expect(page).to have_content "Invalid Email or password."
    expect(page).to have_button "Log In"
  end

end