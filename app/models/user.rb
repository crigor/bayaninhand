class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :date_of_birth, :country, :region, :city, :nationality
  
  has_many :organizations, :through => :organization_roles
  has_many :owned_organizations, :source => :organization, :through => :organization_roles, :conditions => ['role = ?', 'owner']
  has_many :organization_roles
  has_many :administered_organizations, :source => :organization, :through => :organization_roles, :conditions => ["organization_roles.role in ('owner', 'admin')"]
  has_many :participations
  has_many :events, :through => :participations

  def can_manage?(organization)
    self.owned_organizations.include?(organization)
  end

  def volunteered?(event)
    !Participation.where("event_id = ? AND user_id = ?", event.id, self.id).empty?
  end

  def organization_admin?(organization)
    self.administered_organizations.include?(organization)
  end

  def upcoming_events
    self.events.scoped.where("end_date >= '#{Date.today}'")
  end
end
