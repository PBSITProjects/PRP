require 'rails_helper'

RSpec.feature "User Signing Up", :type => :feature do
  let!(:franchise) {create(:franchise)}
  let!(:franchise2) {create(:franchise)}
  let!(:user) {create(:user, email: franchise.email)}
  
  scenario "With valid email" do
    visit "/"
    find("#registration_link").click
    expect(page).to have_content "Sign Up"
    expect(page).to have_button "Sign Me Up"
    fill_in "email", with: franchise2.email
    click_button 'Sign Me Up'
    expect(page).to have_content "Thank you. An email was sent to #{franchise2.email} with instructions to choose your password."
  end

  scenario "With invalid email" do
    visit "/"
    find("#registration_link").click
    expect(page).to have_content "Sign Up"
    expect(page).to have_button "Sign Me Up"
    fill_in "email", with: 'userexamplecom'
    click_button 'Sign Me Up'
    expect(page).to have_content "Sign Up"
    expect(page).to have_button "Sign Me Up"
  end

  scenario "With valid email that does not exist in system" do
    visit "/"
    find("#registration_link").click
    expect(page).to have_content "Sign Up"
    expect(page).to have_button "Sign Me Up"
    fill_in "email", with: 'user@example.com'
    click_button 'Sign Me Up'
    expect(page).to have_content "An account was not found with this email. Please verify with Home Office to find out which email is on file for your account"

  end

  scenario "With valid email that has been signed up already" do

    visit "/"
    find("#registration_link").click
    expect(page).to have_content "Sign Up"
    expect(page).to have_button "Sign Me Up"
    fill_in "email", with: user.email
    click_button 'Sign Me Up'
    expect(page).to have_content "This email address was alread used to sign up on this site. Click the Log In button to access the site or click on Forgot your password?"
  end


end