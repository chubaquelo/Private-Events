class Event < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :attendees
  has_many :users, through: :attendees
end
