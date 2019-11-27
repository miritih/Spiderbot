class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Response
  protect_from_forgery with: :exception
  before_action :set_locale
  after_action { pagy_headers_merge(@pagy) if @pagy }
  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
