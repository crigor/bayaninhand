ActiveAdmin.register Organization do
  index do
    column :id
    column :logo do |organization|
      image_tag organization.image.url(:small)
    end
    column :contact_person
    column :phone_number
    column :email
    column :description do |organization|
      organization.description[0..100]
    end
    column :website
    column :created_at
    column :mission_statement do |organization|
      organization.mission_statement[0..100]
    end
    default_actions
  end
end
