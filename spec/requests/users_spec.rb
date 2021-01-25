require 'rails_helper'

RSpec.describe 'Users' do
  before :each do
    @test_user1 = User.create(name: 'Test1', username: 'test1', email: 'testing_1@test.com', password: '123456', id: 1)
    @test_user2 = User.create(name: 'Test2', username: 'test2', email: 'testing_2@test.com', password: '123456', id: 2)
  end

  feature 'User log' do
    scenario 'user can login and logout' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'testing_1@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
      click_on 'Log out'
      expect(page).to have_content('Sign in')
    end
  end

  feature 'Follow' do
    scenario 'user can follow' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'testing_1@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit '/users'
      expect(page).to have_content('Follow')
    end

    scenario 'user can unfollow' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'testing_1@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit '/users'
      click_on 'Follow'
      expect(page).to have_content('Unfollow')
    end
  end
end
