require 'rails_helper'

RSpec.describe 'creating a user', type: :feature do
  let(:user) { User.create(name: 'mineapolis') }
  scenario 'valid inputs' do
    visit new_user_path
    fill_in 'user_name', with: user.name
    click_on 'Create User'
    expect(page).to have_content("mineapolis's Events")
    visit user_path(user.id)
    expect(page).to have_content('mineapolis')
  end

  scenario 'logout' do
    visit new_user_path
    fill_in 'user_name', with: user.name
    click_on 'Create User'
    expect(page).to have_content("SIGNED as #{user.name}")
    click_on 'Sign Out'
    expect(page).not_to have_content("SIGNED as #{user.name}")
  end
end
