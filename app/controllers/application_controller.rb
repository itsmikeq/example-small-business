class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :reject_locked!, if: :devise_controller?
  before_filter :add_gon_variables
  before_filter :user_agent

  def render_403
    head :forbidden
  end

  def add_gon_variables
    gon.facebook_app_id = Settings.social.facbook_app_id
    gon.google_app_id = Settings.social.google_app_id
  end

  def user_agent
    @user_agent ||= begin
      Rails.logger.info "User agent: #{request.env['HTTP_USER_AGENT']}"
      request.env['HTTP_USER_AGENT']
    end
  end

  def mobile?
    user_agent.match(/iPhone|Android|Mobile/)
  end

  def log_exception(exception)
    application_trace = ActionDispatch::ExceptionWrapper.new(env, exception).application_trace
    application_trace.map! { |t| "  #{t}\n" }
    logger.error "\n#{exception.class.name} (#{exception.message}):\n#{application_trace.join}"
  end

  rescue_from Encoding::CompatibilityError do |exception|
    log_exception(exception)
    render "errors/encoding", layout: "errors", status: 500
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    log_exception(exception)
    render "errors/not_found", layout: "errors", status: 404
  end

  rescue_from ActionView::Template::Error do |exception|
    log_exception(exception)
    render "errors/template_error", layout: "errors", status: 404
  end

  # Devise permitted params
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(
      :email, 
      :password, 
      :password_confirmation) 
    }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(
      :email, 
      :password, 
      :password_confirmation,
      :current_password
      ) 
    }
  end
  
  # Redirects on successful sign in
  def after_sign_in_path_for(resource)
    root_path
  end
  
  # Auto-sign out locked users
  def reject_locked!
    if current_user && current_user.locked?
      sign_out current_user
      user_session = nil
      current_user = nil
      flash[:alert] = "Your account is locked."
      flash[:notice] = nil
      redirect_to root_url
    end
  end
  helper_method :reject_locked!
  
  # Only permits admin users
  def require_admin!
    authenticate_user!
    
    if current_user && !current_user.admin?
      redirect_to root_path
    end
  end
  helper_method :require_admin!
  
end
