class Event < ActiveRecord::Base
  belongs_to :organization
  validates_presence_of :title
end
