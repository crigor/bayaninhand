require "factory_girl"

Factory.define :user do |u|
  u.password "password"
  u.password_confirmation "password"
end

Factory.define :organization do |o|
  o.name "iVolunteer"
  o.association :organization_type
  o.address "123 Test Street"
  o.contact_person "Contack Pearson"
  o.phone_number "1234567"
  o.email "org@ivolunteer.com.ph"
  o.website "ivolunteer.com.ph"
  o.country "Philippines"
  o.mission_statement "Lorem Ipsum Statement"
  o.description "This is a test organization"
end

Factory.define :organization_type do |o|
  o.name "Government Agency"
end

Factory.define :organization_role do |role|
  role.user
  role.organization
end

Factory.define :category do |c|
  c.name "Category"
end

Factory.define :event_type do |e|
  e.name "Event Type"
end

Factory.define :event do |e|
  e.description "Description"
  e.association :organization
  e.start_date { Time.now + 1.week }
  e.end_date { Time.now + 2.weeks }
  e.map "map"
  e.volunteers_needed 100
  e.categories [FactoryGirl.create(:category)]
  e.event_types [FactoryGirl.create(:event_type)]
end

Factory.define :expertise do |e|
end

require "factory_girl/step_definitions"
