class Organization < ActiveRecord::Base
  has_many :events
  validates_presence_of :name, :address, :contact_person, :phone_number, :email, :organization_type, :country, :mission_statement, :description
  validates_numericality_of :phone_number, :only_integer => true, :message => "should be a valid number", :allow_blank => true
  validates_format_of :email, :with => /^.+@.+\..+$/, :message => "should be valid", :allow_blank => true # simple check
  validates_format_of :website, :with => /^((http|https):\/\/)?[a-z0-9]+([-.]{1}[a-z0-9]+).[a-z]{2,5}([.]{1}[a-z0-9]{1,5})?(\/.)?$/ix, :message => "is invalid", :allow_blank => true, :allow_nil => true
  belongs_to :organization_type
  has_and_belongs_to_many :categories
  has_attached_file :image, :styles => { :small => "100x100!" }, :url => "/system/organization_images/:id/:style/:filename", :default_url => "/default/organization/:style.jpg"

  define_index do
    indexes :name
  end

  def upcoming_events
    self.events.scoped.where("end_date >= '#{Date.today}'").order("start_date")
  end

  def finished_events
    self.events.scoped.where("end_date < '#{Date.today}'").order("start_date DESC")
  end
end
