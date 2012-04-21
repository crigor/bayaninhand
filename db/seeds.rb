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
Expertise.transaction do
  #Delete all the entries in expertise
  Expertise.delete_all
  
  #Loop through all the entries and create expertise
  professions.each_with_index do |profession, index|
    Expertise.create(name: profession, id: index) 
  end
end

#Generate Organization Types
organization_types = ["Private", "Public"]
OrganizationType.transaction do
  OrganizationType.delete_all

  organization_types.each_with_index do |type, index|
    OrganizationType.create(id: index, name: type)
  end
end

#Generate Categories
categories = ["Blood Transfer", "Charity", "Education", "Disaster help"]
Category.transaction do
  Category.delete_all

  categories.each_with_index do |category, index|
    Category.create(id: index, name: category)
  end
end

#Generate Event Types
event_types = ["Service", "Money"]
EventType.transaction do
  EventType.delete_all

  event_types.each_with_index do |type, index|
    EventType.create(id: index, name: type)
  end
end

