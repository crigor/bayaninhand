class Organization < ActiveRecord::Base
  has_many :events
  validates_presence_of :name, :address, :contact_person, :phone_number, :email, :website, :organization_type, :country, :mission_statement, :description
  belongs_to :organization_type
end
