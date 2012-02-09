class Event < ActiveRecord::Base
  belongs_to :organization
  validates_presence_of :title, :description, :organization, :start_date, :end_date
  validates_presence_of :categories, :event_types
  has_many :participations
  has_many :volunteers, :source => :user, :through => :participations
  scope :upcoming, lambda { where("end_date >= ?", Date.today) }
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :event_types
  has_attached_file :image, :styles => { :medium => "250x200!", :small => "220x140!" }

  def category
    self.categories.count > 0 ? self.categories[0] : nil
  end

  def time_left
    seconds = start_date_and_time - Time.now
    return [0, 0, 0] if seconds <= 0
    days = (seconds / 1.day).to_i
    hours = (seconds / 1.hour).to_i % 24
    minutes = (seconds / 1.minute).to_i % 60
    [days, hours, minutes]
  end

  def start_date_and_time
    Time.local(self.start_date.year, self.start_date.month, self.start_date.day, (self.start_time.hour rescue 0), (self.start_time.min rescue 0))
  end

  def volunteers_still_needed
    still_needed = (self.volunteers_needed || 0) - self.volunteers.count
    still_needed < 0 ? 0 : still_needed
  end
end
