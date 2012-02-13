class Organization < ActiveRecord::Base
  has_many :events
  validates_presence_of :name, :address, :contact_person, :phone_number, :email, :website, :organization_type, :country, :mission_statement, :description
  validates_numericality_of :phone_number, :only_integer => true, :message => "should be a valid number"
  belongs_to :organization_type
end
