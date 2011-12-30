class Event < ActiveRecord::Base
  belongs_to :organization
  validates_presence_of :title, :description, :organization, :start_date
  has_many :participations
  has_many :volunteers, :source => :user, :through => :participations
  scope :upcoming, lambda { where("start_date >= ?", Date.today) }
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :event_types
  has_attached_file :image, :styles => { :medium => "250x200>", :small => "220x140>" }

  def category
    self.categories.count > 0 ? self.categories[0] : nil
  end
end
