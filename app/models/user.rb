class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :middle_name, :last_name, :mobile_number, :gender, :date_of_birth, :country, :region, :city, :nationality, :expertise_ids, :terms_and_conditions
  validates_presence_of :first_name, :middle_name, :last_name, :mobile_number, :gender, :date_of_birth, :country, :city, :nationality
  validates_presence_of :region, :if => Proc.new {|u| u.country == "Philippines"}
  validates_presence_of :expertises
  validates_numericality_of :mobile_number, :only_integer => true, :message => "should be a valid number"
  validates :terms_and_conditions, :acceptance => { :accept => true }, :on => :create

  has_many :organizations, :through => :organization_roles
  has_many :owned_organizations, :source => :organization, :through => :organization_roles, :conditions => ['role = ?', 'owner']
  has_many :organization_roles
  has_many :administered_organizations, :source => :organization, :through => :organization_roles, :conditions => ["organization_roles.role in ('owner', 'admin')"]
  
  before_save :clear_region
  
  has_many :participations
  has_many :events, :through => :participations
  has_and_belongs_to_many :expertises
  has_many :roles, :class_name => "UserRole"

  define_index do
    indexes :email
    indexes :last_name
    indexes :first_name
  end

  def can_manage?(organization)
    self.organization_admin?(organization)
  end

  def volunteered?(event)
    !Participation.where("event_id = ? AND user_id = ?", event.id, self.id).empty?
  end

  def organization_admin?(organization)
    self.administered_organizations.include?(organization)
  end

  def upcoming_events
    self.events.scoped.where("start_date > ?", Date.today).order("start_date")
  end
  
  def ongoing_events
    self.events.scoped.where("start_date <= ? AND end_date > ?", Date.today, Date.today).order("start_date")
  end

  def finished_events
    self.events.scoped.where("end_date < '#{Date.today}'").order("start_date DESC")
  end

  def admin?
    self.roles.any? {|user_role| user_role.role == "admin"}
  end
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  protected

    def clear_region
      self.region = nil if self.country != "Philippines"
    end
end
