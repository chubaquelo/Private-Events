require 'rails_helper'

RSpec.describe Attendee, type: :model do
  describe 'Create an Attendee registration' do
    let(:user) { User.create(name: 'joaquin') }
    let(:event) { Event.create(location: 'los angeles', datetime: '2020-11-23', author_id: user.id) }
    subject { Attendee.create(user_id: user.id, event_id: event.id) }

    it 'change the count of attendees by one' do
      expect { subject }.to change { Attendee.count }.by(1)
    end

    it 'belongs to an user' do
      attendee = Attendee.reflect_on_association(:user)
      expect(attendee.macro).to eq(:belongs_to)
    end

    it 'belong to an event' do
      attendee = Attendee.reflect_on_association(:event)
      expect(attendee.macro).to eq(:belongs_to)
    end
  end
end
