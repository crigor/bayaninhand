class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :organizations, :through => :organization_roles
  has_many :owned_organizations, :source => :organization, :through => :organization_roles, :conditions => ['role = ?', 'owner']
  has_many :organization_roles
  def can_manage?(organization)
    self.owned_organizations.include?(organization)
  end

  def volunteered?(event)
    !Participation.where("event_id = ? AND user_id = ?", event.id, self.id).empty?
  end
end
