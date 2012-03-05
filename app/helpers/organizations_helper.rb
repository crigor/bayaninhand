module OrganizationsHelper
  def category_list_of(organization)
    organization.categories.map(&:name).join(", ")
  end
end
