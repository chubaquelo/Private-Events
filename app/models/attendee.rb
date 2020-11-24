class Attendee < ApplicationRecord
  belongs_to :event
  belongs_to :user
  # scope :assists, -> {where('datetime <= ?', Time.zone.now)}
  validates_uniqueness_of :user, :scope => :event

  
end
