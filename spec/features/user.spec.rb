require 'rails_helper'

RSpec.feature "ログイン機能", type: :feature do
  scenario "サインアップできるかのテスト" do
    visit new_user_registration_path
    fill_in 'user_name', with:'user_a'
    fill_in 'user_email', with:'test@example.com'
    fill_in 'user_password', with:'password'
    fill_in 'user_password_confirmation', with:'password'
    click_on 'Sign up'
    expect(page).to have_content 'You have signed up successfully'
  end

  scenario "ログインできるかのテスト" do
    FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'user_email', with:'aaa@example.com'
    fill_in 'user_password', with:'password'
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end

end
