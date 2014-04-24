class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, :only => [:create, :update]
  def new
    @positions = Position.all()
    super    
  end

  def create
    build_resource(sign_up_params)
    resource.legacy_password = params[:user][:password]
    resource_saved = resource.save
    yield resource if block_given?
    if resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end     
  end

  def update
    @user = User.find(current_user.id)
    successfully_updated = @user.update_without_password(devise_parameter_sanitizer.sanitize(:account_update))
    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :position_ids => []) }
      devise_parameter_sanitizer.for(:account_update)  { |u| u.permit(:username, :email, :password, :position_ids => []) }
    end

end 
