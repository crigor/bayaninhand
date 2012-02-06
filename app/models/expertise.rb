class Expertise < ActiveRecord::Base
  validates_presence_of :name
  has_and_belongs_to_many :users
end
