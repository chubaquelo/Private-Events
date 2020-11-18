class Event < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :attendees
  has_many :users, through: :attendees

  def self.past
    Event.where("datetime <= Time.zone.now", {timenow: Time.zone.now})
  end

  def self.future
    Event.where("datetime >= :timenow", {timenow: Time.zone.now})
  end
  
end
