require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Create a user' do
    
    subject {User.create(name: 'carlos')}

    it 'change the count of users by one' do
      expect{ subject }.to change{ User.count }.by(1)
    end

    it 'return carlos' do
      expect(subject.name).to eq('carlos')
    end

    it 'have many attended_events' do
      user = User.reflect_on_association(:attended_events)
      expect(user.macro).to eq(:has_many)
    end

    it 'have many authored_events' do
      user = User.reflect_on_association(:authored_events)
      expect(user.macro).to eq(:has_many)
    end

    it 'have many authored_events' do
      user = User.reflect_on_association(:authored_events)
      expect(user.macro).to eq(:has_many)
    end

    it 'have many attendees' do
      user = User.reflect_on_association(:attendees)
      expect(user.macro).to eq(:has_many)
    end
  end
end
