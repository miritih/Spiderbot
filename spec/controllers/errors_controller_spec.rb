RSpec.describe ErrorsController, type: :controller do
  describe "errors" do
    it "#bad_request " do
      get "bad_request"
      expect(response).to have_http_status(400)
      expect(json_response[:title]).to eq "Bad request"
    end

    it "#internal_server_error " do
      get "internal_server_error"
      expect(response).to have_http_status(500)
      expect(json_response[:title]).to eq "Internal server error"
    end

    it "#not_found " do
      get "not_found"
      expect(response).to have_http_status(404)
      expect(json_response[:title]).to eq "Not found"
    end
  end
end
