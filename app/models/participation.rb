class Participation < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  def self.volunteer(event, user)
    return unless Participation.where(:event_id => event, :user_id => user).empty?
    p = Participation.new
    p.event = event
    p.user = user
    p.save
  end
end
