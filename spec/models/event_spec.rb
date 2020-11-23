require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Create an Event' do

    subject { Event.create( location: 'los angeles', datetime: '2020-11-23', author_id: 3)}

    it 'change the count of events by one' do

      expect{ subject }.to change{ Event.count }.by(1)
    end

    it 'return the location los angeles' do
      expect(subject.location).to eq('los angeles')
    end

    it 'have many users' do
      e = Event.reflect_on_association(:users)
      expect(e.macro).to eq(:has_many)
    end

    it 'belong to author' do
      e = Event.reflect_on_association(:author)
      expect(e.macro).to eq(:belongs_to)
    end

    it 'have many attendees' do
      e = Event.reflect_on_association(:attendees)
      expect(e.macro).to eq(:has_many)
    end
  end
end
