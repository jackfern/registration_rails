require 'rails_helper'

RSpec.feature "HomePages", type: :feature do
  context 'Going to a website' do
    Steps 'Going to homepage' do
      Given 'I am on the home page' do
        visit '/'
      end
      Then 'I can click a Sign up button' do
        click_button 'Signup'
        expect(page).to have_content("Registration")
      end
    end
  end

  context 'Registering a user' do
    Steps 'Going to the register page' do
      Given 'I am on the registration page' do
        visit '/registration/register_user'
      end
      Then 'I can fill out a form field and submit user info' do
        expect(page).to have_content("Registration")
        fill_in 'name', with: 'Vivian'
        fill_in 'address', with: '000 A St'
        fill_in 'city', with: 'San Diego'
        fill_in 'state', with: 'CA'
        fill_in 'zipcode', with: '91801'
        fill_in 'country', with: 'USA'
        fill_in 'email', with: 'vivian@cats.com'
        fill_in 'username', with: 'vivian'
        fill_in 'password', with: 'password'
        click_button 'Register'
        expect(page).to have_content("You have successfully registered.")
      end
      When 'I am on the home page' do
        fill_in 'username', with: 'vivian'
        fill_in 'password', with: 'password'
        click_button 'Login'
      end
      Then 'I will see my user info' do
        expect(page).to have_content("You have successfully logged in, you hamster.")
      end
      When 'I am on the user info page' do
        click_button 'Logout'
      end
      Then 'I will see the home page' do
        expect(page).to have_content("New user?")
      end
      When 'I am on the home page' do
        click_button 'Signup'
      end
      Then 'I will see the registration page' do
        expect(page).to have_content("Registration")
        fill_in 'name', with: '1'
        fill_in 'address', with: '1'
        fill_in 'city', with: '1'
        fill_in 'state', with: '1'
        fill_in 'zipcode', with: '1'
        fill_in 'country', with: '1'
        fill_in 'email', with: '1@cats.com'
        fill_in 'username', with: 'vivian'
        fill_in 'password', with: '1'
        click_button 'Register'
        save_and_open_page
        expect(page).to have_content("copycat.")
      end
    end
  end
end
