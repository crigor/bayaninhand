require "factory_girl"

Factory.define :user do |u|
  u.password "password"
  u.password_confirmation "password"
end

Factory.define :organization do |o|
end

Factory.define :organization_role do |role|
  role.user
  role.organization
end

require "factory_girl/step_definitions"
