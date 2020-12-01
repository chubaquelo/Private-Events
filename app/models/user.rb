class User < ApplicationRecord
  has_many :attendees
  has_many :attended_events, through: :attendees, foreign_key: 'event_id', source: :event

  has_many :authored_events, foreign_key: 'author_id', class_name: 'Event'

  validates :name, :presence => true, uniqueness: true, :length => {:minimum => 4, :message => 'Name is too short...'}
end
