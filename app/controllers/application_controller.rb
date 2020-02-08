class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :validate_dairy
  protect_from_forgery with: :exception
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  def validate_dairy
    d1 = Date.today.to_s
    @d2 = Date.parse(d1)
    @last_diary = current_user.diaries.last
    @last_diary_datetime = Datetime.find(@last_diary.datetime_id)
  end

  def after_sign_in_path_for(resource)
    diaries_path
  end

  def after_inactive_sign_up_path_for(resource)
    diaries_path
  end

   
end
