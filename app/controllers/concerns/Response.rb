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
    meta_options = options[:meta].merge(generate_pagination)
    options[:meta] = meta_options
    options
  end

  def generate_pagination
    metadata =  pagy_metadata(@pagy)
    {
        current_page: metadata[:page],
        prev_page: metadata[:prev],
        next_page: metadata[:next],
        page_count: metadata[:pages],
        per_page: metadata[:items],
        total_count: metadata[:count],
        links: [{"scaffold_url": metadata[:scaffold_url]},
                {"self": metadata[:page_url]},
                {"first": metadata[:first_url]},
                {"previous": metadata[:prev_url]},
                {"next": metadata[:next_url]},
                {"last": metadata[:last_url]}
              ]
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
