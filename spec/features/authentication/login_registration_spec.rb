require 'rails_helper'

feature 'Authentication' do
  context 'a visitor' do
    scenario 'can register for an account' do
      visit root_path

      click_on 'Register'

      expect(current_path).to eq(new_user_registration_path)

      fill_in 'user_email', with: 'test@mail.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_on 'Sign up'

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end

    scenario 'can log in to their account' do
      user = create(:user)

      visit root_path

      click_on 'Log In'

      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      within '.actions' do
        click_on 'Log In'
      end

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Signed in successfully.')
    end

    scenario 'can log out of their account' do
      user = create(:user)
      sign_in user

      visit root_path

      click_on 'Log Out'

      expect(page).to have_content('Signed out successfully.')
    end
  end
end
