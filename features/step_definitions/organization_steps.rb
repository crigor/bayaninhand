Then /^the organization type of "([^"]*)" should be "([^"]*)"$/ do |organization_name, organization_type_name|
  organization = Organization.find_by_name(organization_name)
  organization.organization_type.name.should == organization_type_name
end

