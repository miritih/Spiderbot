module Response
  def render_response(resource, status = :ok)
    if block_given?
      yield(resource, status)
    else
      render json: resource, status: status
    end
  end

  def render_error_response(resource, status = :unprocessable_entity)
    if block_given?
      yield(resource, status)
    else
      render json: {
        status: I18n.t("errors.#{status}.status"),
        title: I18n.t("errors.#{status}.title"),
        detail: I18n.t("errors.#{status}.detail"),
        errors: resource
      }, status: status
    end
  end
end
