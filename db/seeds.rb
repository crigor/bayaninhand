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
