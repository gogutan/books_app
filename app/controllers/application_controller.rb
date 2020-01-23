# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale, :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  protected
    def configure_permitted_parameters
      [:sign_up, :account_update].each { |action| devise_parameter_sanitizer.permit(action, keys: [:postcode, :address, :introduction, :icon]) }
    end
end
