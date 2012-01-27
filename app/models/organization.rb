class Organization < ActiveRecord::Base
  has_many :events
  validates_presence_of :name
  belongs_to :organization_type
end
