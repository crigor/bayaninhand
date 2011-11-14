class Event < ActiveRecord::Base
  belongs_to :organization
  validates_presence_of :title
  has_many :participations
  has_many :volunteers, :source => :user, :through => :participations
  scope :upcoming, lambda { where("date >= ?", Date.today) }
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :event_types
end
