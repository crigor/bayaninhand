class Event < ActiveRecord::Base
  belongs_to :organization
  validates_presence_of :title
  has_many :participations
  has_many :volunteers, :source => :user, :through => :participations
  #scope :upcoming, lambda { where("start_date >= ?", Date.today) }
end
