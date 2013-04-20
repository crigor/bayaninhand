class EventMessage < ActiveRecord::Base
  belongs_to :sender, :class_name => "User", :foreign_key => "user_id"
  belongs_to :participation
end
