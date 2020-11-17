class Event < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :attendees
  has_many :users, through: :attendees
end
