class Attendee < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates_uniqueness_of :user, scope: :event
end
