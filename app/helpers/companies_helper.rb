module CompaniesHelper
  def resource_name
    :company
  end

  def resource
    @resource ||= Company.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:company]
  end
end
