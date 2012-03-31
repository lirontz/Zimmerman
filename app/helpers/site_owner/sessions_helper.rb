module SiteOwner::SessionsHelper
  def resource_name
    :site_owner
  end

  def resource
    @resource ||= SiteOwner.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:site_owner]
  end
end
