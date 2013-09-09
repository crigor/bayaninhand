ActiveAdmin.register Event do
  index do
    column :id
    column :title
    column :description
    column :address
    column :start_date
    column :end_date
    column :start_time
    column :end_time
    column :volunteers_needed
    column "Volunteers" do |event|
      event.volunteers.count
    end
    column :organization
    column "Org Id" do |event|
      event.organization.id
    end
    default_actions
  end
end
