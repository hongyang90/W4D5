require 'rails_helper'

RSpec.feature "Users", type: :feature do
  feature 'Sign Up' do
    background :each do
      visit new_user_path
    end
  
    scenario 'has a user sign up page' do
      expect(page).to have_content('Sign Up')
    end
  
    scenario 'takes a username, password, email' do
      expect(page).to have_content('Username')
      expect(page).to have_content('Password')
    end
  
    scenario 'redirect to user\'s show and displays username on success' do
      fill_in 'Username', with: 'harry_potter'
      fill_in 'Password', with: 'abcdef'
     
      click_button 'Sign Up!'
   
      expect(page).to have_content('harry_potter')
      user = User.find_by(username: 'harry_potter')
      expect(current_path).to eq(user_path(user))
    end
  end



end
