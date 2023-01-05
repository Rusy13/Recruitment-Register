# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe Devise, type: :system do
  # before_action :set_locale
  let(:email_userexecutor) { 'Test@gmail.ru' }
  let(:password_userexecutor) { '111111' }



  describe 'User sign up' do
    scenario 'sign up without params' do
      default_locale = :en
      visit new_userexecutor_registration_path
      click_button 'Sign up'
      expect(page).to have_content("errors prohibited this userexecutor from being saved:\nEmail can't be blank\nPassword can't be blank\n")
    end
    scenario 'sign up without email and confinmation' do
      visit new_userexecutor_registration_path
      fill_in 'Password', with: password_userexecutor
      fill_in 'Password confirmation', with: password_userexecutor
      click_button 'Sign up'
      expect(page).to have_content("Email can't be blank\n")
    end
      scenario 'sign up without email and password' do
        visit new_userexecutor_registration_path
        fill_in 'Password confirmation', with: password_userexecutor
        click_button 'Sign up'
        expect(page).to have_content("Email can't be blank\n")
      end
    scenario 'sign up without email' do
      visit new_userexecutor_registration_path
      fill_in 'Password', with: password_userexecutor
      fill_in 'Password confirmation', with: password_userexecutor
      click_button 'Sign up'
      expect(page).to have_content("Email can't be blank\n")
    end
    scenario 'sign up without password' do
      visit new_userexecutor_registration_path
      fill_in 'Email', with: email_userexecutor, wait: 3
      fill_in 'Password confirmation', with: password_userexecutor
      click_button 'Sign up'
      expect(page).to have_content("Password confirmation doesn't match Password\n")
    end
    scenario 'sign up, but password confirmation does not match password' do
      visit new_userexecutor_registration_path
      fill_in 'Email', with: email_userexecutor, wait: 3
      fill_in 'Password', with: password_userexecutor
      fill_in 'Password confirmation', with: "#{password_userexecutor}1"
      click_button 'Sign up'
      expect(page).to have_content("Password confirmation doesn't match Password\n")
    end
    scenario 'sign up' do
      visit new_userexecutor_registration_path
      fill_in 'Email', with: email_userexecutor, wait: 3
      fill_in 'Password', with: password_userexecutor
      fill_in 'Password confirmation', with: password_userexecutor
      click_button 'Sign up'
      expect(page).to have_content("Chose role!")
    end
  end






  describe 'User sign in' do
  let(:user_one) do
    Userexecutor.create(email: 'Exe@gmail.ru', password: '111111', full_name: 'Ruslan Ugarov', role: false)
  end
  let(:user_two) do
    Userexecutor.create(email: 'Cus1@gmail.ru', password: '111111', full_name: 'Roman Ugarov', role: true)
  end
    scenario 'sign in without params' do
      visit new_userexecutor_session_path
      click_button 'Log in'
      expect(page).to have_content("Invalid Email or password.")
    end
    scenario 'sign in without email' do
      visit new_userexecutor_session_path
      fill_in 'Password', with: password_userexecutor
      click_button 'Log in'
      expect(page).to have_content("Invalid Email or password.")
    end
    scenario 'sign in without password' do
      visit new_userexecutor_session_path
      fill_in 'Email', with: email_userexecutor, wait: 3
      click_button 'Log in'
      expect(page).to have_content("Invalid Email or password.")
    end
    scenario 'sign in' do
      visit new_userexecutor_session_path
      fill_in 'Email', with: email_userexecutor, wait: 3
      fill_in 'Password', with: password_userexecutor
      click_button 'Log in'
      expect(page).to have_content("Invalid Email or password.")
    end
  end




  describe 'User page navigation' do

    scenario 'sign up cus' do
      visit new_userexecutor_registration_path
      fill_in 'Email', with: email_userexecutor, wait: 3
      fill_in 'Password', with: password_userexecutor, wait: 3
      fill_in 'Password confirmation', with: password_userexecutor
      click_button 'Sign up'
      click_button 'Go'
      fill_in 'name1', with: "Ruslan Ugarov"
      fill_in 'inn1', with: "70102520"
      fill_in 'number1', with: "894992636391"
      fill_in 'website1', with: "https://bmstu.ru"
      choose(option:'false')
      click_button 'Add information'
      click_on 'Return'
      expect(page).to have_content("View executor")
    end




    scenario 'sign up cus' do
      visit new_userexecutor_registration_path
      fill_in 'Email', with: email_userexecutor, wait: 3
      fill_in 'Password', with: password_userexecutor, wait: 3
      fill_in 'Password confirmation', with: password_userexecutor
      click_button 'Sign up'
      click_button 'Go'
      fill_in 'name1', with: "Ruslan Ugarov"
      fill_in 'inn1', with: "70102520"
      fill_in 'number1', with: "894992636391"
      fill_in 'website1', with: "https://bmstu.ru"
      choose(option:'false')
      click_button 'Add information'
      click_on 'Return'
      expect(page).to have_content("View executor")
    end



    scenario 'sign up exe' do
      visit new_userexecutor_registration_path
      fill_in 'Email', with: email_userexecutor, wait: 3
      fill_in 'Password', with: password_userexecutor, wait: 3
      fill_in 'Password confirmation', with: password_userexecutor
      click_button 'Sign up'
      click_button 'Go'
        fill_in 'name1', with: "Rus Uga"
        fill_in 'inn1', with: "60102520"
        fill_in 'number1', with: "894992636392"
        fill_in 'website1', with: "https://bmstu.ru"
        choose(option:'true')
        click_button 'Add information'
        click_on 'Return'
        expect(page).to have_content("View customer")
    end
  end







  describe 'User billing' do
    scenario 'billing cus' do
      visit new_userexecutor_registration_path
      fill_in 'Email', with: email_userexecutor, wait: 3
      fill_in 'Password', with: password_userexecutor, wait: 3
      fill_in 'Password confirmation', with: password_userexecutor
      click_button 'Sign up'
      click_button 'Go'
      fill_in 'name1', with: "Ruslan Ugarov"
      fill_in 'inn1', with: "70102520"
      fill_in 'number1', with: "8949926363"
      fill_in 'website1', with: "https://bmstu.ru"
      choose(option:'false')
      click_button 'Add information'
      click_on 'Return'
      # expect(page).to have_content("View executor")
      click_on 'Personal selection'
      sleep(5)
      expect(page).to have_content("Confirm!")
    end
    scenario 'billing exe' do
      visit new_userexecutor_registration_path
      fill_in 'Email', with: email_userexecutor, wait: 3
      fill_in 'Password', with: password_userexecutor, wait: 3
      fill_in 'Password confirmation', with: password_userexecutor
      click_button 'Sign up'
      click_button 'Go'
      fill_in 'name1', with: "Rus Uga"
      fill_in 'inn1', with: "60102520"
      fill_in 'number1', with: "8949926363"
      fill_in 'website1', with: "https://bmstu.ru"
      choose(option:'true')
      click_button 'Add information'
      click_on 'Return'
      click_on 'Create Portfoli'
      sleep(5)
      expect(page).to have_content("Confirm!")
    end
  end









  describe 'Exe add req' do
    scenario 'add req' do
      visit new_userexecutor_registration_path
      fill_in 'Email', with: email_userexecutor, wait: 3
      fill_in 'Password', with: password_userexecutor, wait: 3
      fill_in 'Password confirmation', with: password_userexecutor
      click_button 'Sign up'
      click_button 'Go'
      fill_in 'name1', with: "Ruslan Ugarov"
      fill_in 'inn1', with: "70102520"
      fill_in 'number1', with: "894992636391"
      fill_in 'website1', with: "https://bmstu.ru"
      choose(option:'true')
      click_button 'Add information'
      click_on 'Return'
      # expect(page).to have_content("View executor")
      click_on 'Add requirement'
      sleep(5)
      expect(page).to have_content("Enter the nearest free date and fee")
    end
  end











describe 'Interaction between of two users' do
  let(:user_one) do
    Userexecutor.create(email: 'Exe@gmail.ru', password: '111111', full_name: 'Ruslan Ugarov', role: false)
  end
  let(:user_two) do
    Userexecutor.create(email: 'Cus1@gmail.ru', password: '111111', full_name: 'Roman Ugarov', role: true)
  end
  let(:message) { 'Hello!' }
  def user_sign_in(user)
    sleep(5)
    visit new_userexecutor_session_path
    fill_in 'Email', with: user.email, wait: 3
    fill_in 'Password', with: user.password, wait: 3
    click_button 'Log in'
  end
  scenario 'Visit Show Profile' do
    user_sign_in(user_one)
    visit current_path
    click_on 'Chat'
    expect(page).to have_content(user_two.email)
  end
end




# describe 'SMS' do
#   let(:user_one) do
#     Userexecutor.create(email: 'Exe@gmail.ru', password: '111111', full_name: 'Ruslan Ugarov', role: false)
#   end
#   let(:user_two) do
#     Userexecutor.create(email: 'Cus1@gmail.ru', password: '111111', full_name: 'Roman Ugarov', role: true)
#   end
#   let(:message) { 'Hello!' }
#   def user_sign_in(user)
#     sleep(5)
#     visit new_userexecutor_session_path
#     fill_in 'Email', with: user.email, wait: 3
#     fill_in 'Password', with: user.password, wait: 3
#     click_button 'Log in'
#   end
#   scenario 'Visit Show Profile' do
#     user_sign_in(user_one)
#     visit current_path
#     click_on 'Chat'
#     click_on user_two.email
#     fill_in 'chat-text', with: message
#     click_on 'Create Message'
#     expect(page).to have_content('less than a minute Ago')
#     expect(page).to have_content(message)
#   end
# end


























































































  # describe 'Contact' do

  #   scenario 'Contact cus' do
  #     visit new_userexecutor_registration_path
  #     fill_in 'Email', with: email_userexecutor, wait: 3
  #     fill_in 'Password', with: password_userexecutor, wait: 3
  #     fill_in 'Password confirmation', with: password_userexecutor
  #     click_button 'Sign up'
  #     click_button 'Go'
  #     fill_in 'name1', with: "Ruslan Ugarov"
  #     fill_in 'inn1', with: "70102520"
  #     fill_in 'number1', with: "894992636391"
  #     fill_in 'website1', with: "https://bmstu.ru"
  #     choose(option:'false')
  #     click_button 'Add information'
  #     click_on 'Return'
  #     # click_on(class: 'nav-item dropdown')
  #     # click_on 'Exit'
  #     # expect(page).to have_content("View executor")
  #     find('#drdr').click
  #     # option=find("ul.dropdown-menu.inner > li", text: "Create Account")

  #     # click_on 'Contacts'
  #     sleep(5)
  #     # expect(page).to have_content("For questions and suggestions")
  #   end
  # end



  #   scenario 'Contact exe' do
  #     visit new_userexecutor_registration_path
  #     fill_in 'Email', with: email_userexecutor, wait: 3
  #     fill_in 'Password', with: password_userexecutor, wait: 3
  #     fill_in 'Password confirmation', with: password_userexecutor
  #     click_button 'Sign up'
  #     click_button 'Go'
  #       fill_in 'Name1', with: "Rus Uga"
  #       fill_in 'Inn1', with: "60102520"
  #       fill_in 'Number1', with: "894992636392"
  #       fill_in 'Website1', with: "https://bmstu.ru"
  #       choose(option:'true')
  #       click_button 'Add information'
  #       click_on 'Return'
  #       find('nav-link dropdown-toggle').click
  #       # click_on 'Contacts'
  #       sleep(5)
  #       expect(page).to have_content("For questions and suggestions")
  #   end
  # end


end