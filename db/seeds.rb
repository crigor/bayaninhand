# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


#Generate a default value for the expertise collection
professions = [ "Agriculture, Forestry and Fisher",
                "Arts",
                "Architect and Building",
                "Business and Administration",
                "Computing",
                "Education",
                "Engineering",
                "Environmental Protection",
                "Health",
                "Humanities",
                "Journalism",
                "Law",
                "Life Science",
                "Manufacturing",
                "Mathematics",
                "Personal Development",
                "Personal Services",
                "Physical Sciences",
                "Security Services",
                "Social and Behavioral Science"]
#Update database
puts 'Generate Expertise'
Expertise.transaction do
  #Delete all the entries in expertise
  Expertise.delete_all

  #Loop through all the entries and create expertise
  professions.each_with_index do |profession, index|
    puts 'Add Expertise: ' + profession
    Expertise.create(name: profession, id: index) 
  end
end

#Generate Organization Types
puts 'Generate Organization Types'
organization_types = ["Private", "Public"]
OrganizationType.transaction do
  OrganizationType.delete_all

  organization_types.each_with_index do |type, index|
    puts 'Add OrganizationType: ' + type
    OrganizationType.create(id: index, name: type)
  end
end

#Generate Categories
puts 'Generate Categories'
categories = ["Blood Transfer", "Charity", "Education", "Disaster help"]
Category.transaction do
  Category.delete_all

  categories.each_with_index do |category, index|
    puts 'Add Category: ' + category
    Category.create(id: index, name: category)
  end
end

#Generate Event Types
puts 'Generate Event types'
event_types = ["Service", "Money"]
EventType.transaction do
  EventType.delete_all

  event_types.each_with_index do |type, index|
    puts 'Add Event type: ' + type
    EventType.create(id: index, name: type)
  end
end

#Generate Organizations
puts 'Generate Organizations'
@organization = ["org_name_", "contact_", "123456", "x@x.com", "www.x.com", "PH", "address test", "1"]
organizations = [@organization, @organization, @organization]

Organization.transaction do
  Organization.delete_all
  org_type = OrganizationType.first()
  organizations.each_with_index do |org, index|
    puts "Add organization: #{org}"
    Organization.create(name: org[0] + index.to_s, contact_person: org[1] + index.to_s,
                      phone_number: org[2], email: org[3], website: org[4], country: org[5],
                      address: org[6], organization_type_id: org_type.id, mission_statement: "mission test", description: "test org")
  end
end


#Generate Events
puts 'Generate Events'
@events = {:title => "event_", :description => "test event", :address => 'Manila', :map => 'ph', :start => Time.now, 
            :end => Time.now + 1.month, :volunteers_needed => 10}
Event.transaction do
org = Organization.first
  (1..10).each do |index|
    puts "Add event: #{@events[:title] + index.to_s}"
    Event.create(title: @events[:title] + index.to_s, description: @events[:description], organization_id: org.id, address: @events[:address],
                 map: @events[:map], start_date: @events[:start], end_date: @events[:end], volunteers_needed: @events[:volunteers_needed], 
                )
  end
end

