require "factory_girl"

Factory.define :user do |u|
  u.password "password"
  u.password_confirmation "password"
end

Factory.define :organization do |o|
  o.name "iVolunteer"
end

Factory.define :organization_type do |o|
end

Factory.define :organization_role do |role|
  role.user
  role.organization
end

Factory.define :event do |e|
  e.description "Description"
  e.association :organization
  e.start_date { Time.now + 1.week }
  e.end_date { Time.now + 2.weeks }
end

Factory.define :event_type do |e|
end

Factory.define :category do |c|
end

Factory.define :expertise do |e|
end

require "factory_girl/step_definitions"
