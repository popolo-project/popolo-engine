module PopoloHelper
  def nested_areas_path(areas)
    super areas.map(&:slug)
  end

  def nested_area_path(areas)
    super areas.map(&:slug)
  end

  def nested_organizations_path(organizations)
    super organizations.map(&:slug)
  end

  def nested_organization_path(organizations)
    super organizations.map(&:slug)
  end
end
