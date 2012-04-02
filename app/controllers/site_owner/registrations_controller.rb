class SiteOwner::RegistrationsController < Devise::RegistrationsController
  #def new
  #  if current_site_owner
  #    return render :text => "RegistrationsController - current_site_owner exist!!!"
  #  else
  #	 render 'site_owner/registrations/new'
  #  end
  #end

  #def require_no_authentication
  #  args = devise_mapping.no_input_strategies.dup.push :scope => resource_name 
  #  if warden.authenticate?(*args) 
  #    resource = warden.user(resource_name)
  #    flash[:alert] = I18n.t("devise.failure.already_authenticated") 
  #    
  #    #return render :text => "RegistrationsController.require_no_authentication - after_sign_in_path_for(resource) - " + after_sign_in_path_for(resource)
  #    
  #    redirect_to after_sign_in_path_for(resource)
  #  end 
  #end

  #def create
  #	@site_owner = SiteOwner.new(params[:site_owner])

  #	if @site_owner.save
  #    redirect_to '/site_owner/home'
  #	else
  #		return render 'site_owner/registrations/new'
  #	end
  #end

  def after_sign_in_path_for(resource)
    '/site_owner/cp'
  end
end
