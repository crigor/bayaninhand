class RecurringEvent < ActiveRecord::Base
  include IceCube
  belongs_to :organization
  attr_accessor :category_ids, :event_type_ids

  def create_multiple_events(image)
    schedule = Schedule.new start_date_and_time
    day = frequency_day.blank? ? start_date.strftime("%A") : frequency_day
    schedule.add_recurrence_rule Rule.weekly.day(day.downcase.to_sym)
    schedule.occurrences(end_date_and_time).each do |date|
      event = Event.new :title => title, :description => description,
        :address => address, :start_date => start_date,
        :end_date => end_date, :start_time => start_time,
        :end_time => end_time, :volunteers_needed => volunteers_needed,
        :status => status, :organization => organization,
        :category_ids => category_ids, :event_type_ids => event_type_ids,
        :image => image
      event.save
    end
  end

  def start_date_and_time
    Time.local(self.start_date.year, self.start_date.month, self.start_date.day, (self.start_time.hour rescue 0), (self.start_time.min rescue 0))
  end

  def end_date_and_time
    Time.local(self.end_date.year, self.end_date.month, self.end_date.day, (self.end_time.hour rescue 0), (self.end_time.min rescue 0))
  end

  def self.from_event(event)
    recurring_event = self.new(:title => event.title,
      :description => event.description,
      :address => event.address,
      :start_date => event.start_date,
      :end_date => event.end_date,
      :start_time => event.start_time,
      :end_time => event.end_time,
      :volunteers_needed => event.volunteers_needed,
      :status => event.status,
      :organization => event.organization,
      :category_ids => event.category_ids,
      :event_type_ids => event.event_type_ids)
    return recurring_event
  end

end
