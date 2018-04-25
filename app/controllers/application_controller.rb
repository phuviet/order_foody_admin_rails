class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_ability, except: :sessions
  include SessionsHelper

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      if current_user.nil?
        format.html { redirect_to new_session_path, notice: 'you must_login_first' }
      else
        format.json { head :forbidden, content_type: 'text/html' }
        format.html do
          render file: "#{Rails.root}/public/401", layout: false, status: :forbidden
        end
        format.js { head :forbidden, content_type: 'text/html' }
      end
    end
  end

  def current_user
    return if session[:user_id].blank?
    @current_user ||= User.find(session[:user_id])
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end
end
