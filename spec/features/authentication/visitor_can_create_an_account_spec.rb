require 'rails_helper'

feature 'Visitor' do
  context 'on the root path' do
    scenario 'can register for an account' do
      visit root_path

      click_on 'Register'

      expect(current_path).to eq(new_user_registration_path)

      fill_in 'user_email', with: 'test@mail.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_on 'Sign up'

      expect(current_path).to eq(root_path)
    end
  end
end
