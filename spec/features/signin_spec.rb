require 'spec_helper'

describe "the signin process", type: :feature do

  user = FactoryGirl.create(:user)

  it 'has a sign in page' do
    visit new_session_url
    expect(page).to have_content 'anarchy'
  end

  it 'signs me in' do
    visit root_url
    within('.sign-in-form') do
      fill_in 'emailInput', with: "jfk303@nyu.edu"
      fill_in 'passwordInput', with: "password"
    end
    click_button 'signInSubmit'
    expect(page).to have_content "Log in successful!"
  end
end