class Organization < ActiveRecord::Base
  has_many :events
  validates_presence_of :name, :address, :contact_person, :phone_number, :email, :website, :organization_type, :country, :mission_statement, :description
  validates_numericality_of :phone_number, :only_integer => true, :message => "should be a valid number"
  validates_format_of :email, :with => /^.+@.+\..+$/, :message => "should be valid" # simple check
  belongs_to :organization_type
  has_and_belongs_to_many :categories
end
