class ErrorsController < ApplicationController
  def bad_request
    render_exception(:bad_request)
  end

  def internal_server_error
    render_exception(:internal_server_error)
  end

  def not_found
    render_exception(:not_found)
  end

  private

  def process_action(*args)
    super
  rescue ActionDispatch::Http::Parameters::ParseError => _e
    render_exception(:bad_request)
  end

  def render_exception(status)
    render_error_response({}, status) do |_, _status|
      render json: {
        status: I18n.t("errors.application.#{_status}.status"),
        title: I18n.t("errors.application.#{_status}.title"),
        detail: I18n.t("errors.application.#{_status}.detail"),
        errors: [I18n.t("errors.application.#{_status}.error_message")]
      }, status: _status
    end
  end
end
