module Response
  def render_response(serializer, obj, options = {})
    if block_given?
      return yield(obj, status)
    end
    if obj.class.name == "ActiveRecord::Relation"
      return render_collection(serializer, obj, options)
    end

    render_record(serializer, obj, options)
  end

  def render_collection(serializer, collection, options = {})
    options = meta_pagination(collection, options)
    render_record(serializer, collection, options)
  end

  def render_record(serializer, record, options = {})
    render json: serializer.new(record, options), status: options[:status]
  end

  def meta_pagination(paginated_obj, options = {})
    options[:meta] = {} unless options.has_key?(:meta)
    meta_options = options[:meta].merge(generate_pagination(paginated_obj))
    options[:meta] = meta_options
    options
  end

  def generate_pagination(paginated_obj)
    {
      links: {
        current_page: paginated_obj.current_page,
        prev_page: paginated_obj.previous_page,
        next_page: paginated_obj.next_page,
        total_pages: paginated_obj.total_pages
      }
    }
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
