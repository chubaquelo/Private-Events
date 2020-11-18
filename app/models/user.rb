class User < ApplicationRecord
  has_many :attendees
  has_many :events, through: :attendees
  has_many :authored_events, foreign_key: 'author_id', class_name: 'Event'
end
