class Event < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :attendees
  has_many :users, through: :attendees
  validates :datetime, :presence => true, :length => {:minimum => 4, :message => 'Name is too short...'}

  scope :past, -> { where('datetime < ?', Time.zone.now) }
  scope :future, -> { where('datetime >= ?', Time.zone.now) }
end
