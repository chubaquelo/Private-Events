class User < ApplicationRecord
  has_many :attendees
  has_many :attended_events, through: :attendees, foreign_key: 'event_id', class_name: 'Attendee'
  has_many :authored_events, foreign_key: 'author_id', class_name: 'Event'
end
