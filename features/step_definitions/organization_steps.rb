Then /^the organization type of "([^"]*)" should be "([^"]*)"$/ do |organization_name, organization_type_name|
  organization = Organization.find_by_name(organization_name)
  organization.organization_type.name.should == organization_type_name
end

Given /^I create an organization with the name "([^"]*)"$/ do |org_name|
  create_organization(org_name)
end

def create_organization(org_name)
  steps %Q{
    Given an organization type exists with a name of "Government Agency"
    When I go to the new organization page
    And I fill in the following:
      | Name   | #{org_name}  |
      | Address | Address |
      | Contact Person | Contact Person |
      | Contact Number | 1234 |
      | Email | org@ivolunteer.com.ph |
      | Website | ivolunteer.com.ph |
      | Mission Statement | Mission Statement |
      | Description | Description |
    And I select "Philippines" from "Country"
    And I select "Government Agency" from "Organization Type"
    And I press "Submit"
  }
end
