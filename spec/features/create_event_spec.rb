require 'rails_helper'

RSpec.describe 'creating a new event', type: :feature do
  let(:user) { User.create(name: 'mineapolis') }
  scenario 'create event' do
    visit new_session_path
    fill_in 'name', with: user.name
    click_on 'Save'
    expect(page).to have_content("SIGNED as #{user.name}")
    visit new_event_path
    fill_in 'event_location', with: 'argentina'
    fill_in 'event_datetime', with: Time.now + 10.days
    click_on 'Create Event'
    expect(page).not_to have_content('Location: peru')
  end

  scenario 'valid inputs' do
    visit new_session_path
    fill_in 'name', with: user.name
    click_on 'Save'
    expect(page).to have_content("SIGNED as #{user.name}")
    visit new_event_path
    fill_in 'event_location', with: 'argentina'
    fill_in 'event_datetime', with: Time.now + 10.days
    click_on 'Create Event'
    expect(page).to have_content('Location: argentina')
  end
end
