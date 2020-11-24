require 'rails_helper'

RSpec.describe 'confirm assistance to an event', type: :feature do
  let(:user) { User.create(name: 'mineapolis') }
  let(:event) { Event.create(location: 'argentina', datetime: Time.now + 2.days, author_id: user.id)}
  scenario 'valid inputs' do
    visit new_session_path
    fill_in 'name', with: user.name
    click_on 'Save'
    visit event_path(event.id)
    click_on 'I will assist'
    expect(page).to have_content("Attendees:\n#{user.name}")
    click_on 'I will not assist'
    expect(page).not_to have_content("Attendees:\n#{user.name}")
  end
end