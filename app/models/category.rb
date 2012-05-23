class Category < ActiveRecord::Base
  has_and_belongs_to_many :events
  has_and_belongs_to_many :organizations

  def self.popular(limit=10)
    Category.select("categories.*, count(events.id) as events_count").joins("INNER JOIN categories_events on categories_events.category_id = categories.id").joins("INNER JOIN events on events.id = categories_events.event_id").group("categories.id").where("events.end_date >= #{Date.today}").order("events_count DESC").limit(limit)
  end
end
