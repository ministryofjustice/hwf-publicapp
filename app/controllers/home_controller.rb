class HomeController < ApplicationController
  protect_from_forgery only: :update

  def index; end

  def checklist; end

  def terms_and_conditions; end

  def accessibility_statement; end

  def privacy_policy; end

  def cookies
    @form = Forms::Cookie::SettingForm.new(
      request: request
    )
  end

  def update
    Forms::Cookie::SettingForm.new(
      cookie_setting: cookie_setting,
      response: response
    ).save
    flash[:cookie_notification] = cookie_notification
    redirect_to request.referer
  end

  private

  def cookie_setting
    params['cookie_setting'].
      permit(:cookie_setting).
      to_h.
      fetch(:cookie_setting)
  end

  def cookie_notification
    if params[:cookie_banner].present?
      cookie_setting
    else
      true
    end
  end

end
