require 'spec_helper'

describe "the signin process", type: :feature do

  user = FactoryGirl.create(:user)

  it 'has a sign in page' do
    visit new_session_url
    expect(page).to have_content 'anarchy'
  end

  it 'signs me in' do
    visit '/session/new'
    within('.sign-in-form') do
      fill_in 'emailInput', with: "jfk303@nyu.edu" # user.email
      fill_in 'passwordInput', with: "password" # user.password
    end
    click_button 'signInSubmit'
    expect(page).to have_content 'NoGod'
  end
end