require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Create an Event' do

    let(:user) { User.create(name:'joaquin') }
    subject { Event.create( location: 'los angeles', datetime: '2020-11-23', author_id: user.id)}


    it "change the count of events by one" do
      expect{ subject }.to change{ Event.count }.by(1)
    end

    it 'return the location los angeles' do
      expect(subject.location).to eq('los angeles')
    end

    it 'have many users' do
      event = Event.reflect_on_association(:users)
      expect(event.macro).to eq(:has_many)
    end

    it 'belong to author' do
      event = Event.reflect_on_association(:author)
      expect(event.macro).to eq(:belongs_to)
    end

    it 'have many attendees' do
      event = Event.reflect_on_association(:attendees)
      expect(event.macro).to eq(:has_many)
    end
  end
end
