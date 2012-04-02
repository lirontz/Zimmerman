class SiteOwner::SessionsController < Devise::SessionsController

	#def create
  #  if current_site_owner
  #    redirect_to '/site_owner/home'
  #    #flash[:notice] = t("devise.sessions.signed_in")
	#    #render :text => "SessionsController.create!!!"
  #  else
  #    #flash[:error] = t("devise.site_owner.error_signed_in")
  #    render 'site_owner/sessions/new'
  #  end
  #end

  #def destroy 
  #  redirect_path = '/site_owner/home'
  #  signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
  #  set_flash_message :notice, :signed_out if signed_out

    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request 
  #  respond_to do |format| 
  #    format.any(*navigational_formats) { redirect_to redirect_path }
  #    format.all do
  #      method = "to_#{request_format}"
  #      text = {}.respond_to?(method) ? {}.send(method) : ""
  #      render :text => text, :status => :ok
  #    end
  #  end
  #end

  def after_sign_in_path_for(resource)
    '/site_owner/cp'
  end

  def after_sign_out_path_for(resource)
    '/site_owner/home'
  end

end
