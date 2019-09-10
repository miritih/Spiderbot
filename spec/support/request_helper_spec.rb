module RequestHelperSpec
  # Parse JSON response to ruby hash
  def json_response
    JSON.parse(response.body, symbolize_names: true)
  end
end
