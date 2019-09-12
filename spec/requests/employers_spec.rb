RSpec.describe "Employers", type: :request do
  describe "Employer requests" do
    let!(:employer) { create :employer }

    let(:valid_params) do
      {
        employer: {
          name: Faker::Company.name,
          location: "Nairobi Kenya",
          employer_type: Faker::Company.type,
          sector: Faker::Company.industry
        }
      }
    end

    let(:invalid_params) do
      {
        employer: {
          name: "",
          location: "",
          employer_type: Faker::Company.type
        }
      }
    end

    let(:update_params) do
      {
        employer: {
          name: Faker::Company.name,
          employer_type: Faker::Company.type
        }
      }
    end

    describe "GET /employers" do
      it "gets all employers" do
        get employers_path
        expect(response).to have_http_status(200)
        expect(json_response.first[:name]).to eq(employer.name)
      end

      it "gets single employer" do
        get employer_path employer
        expect(response).to have_http_status(200)
        expect(json_response[:name]).to eq(employer.name)
      end
    end

    describe "POST /employer" do
      context "When params are valid" do
        it "create employer successfully" do
          post employers_path params: valid_params
          expect(response).to have_http_status(201)
          # return created employer
          expect(json_response[:name]).to eq(valid_params[:employer][:name])
        end
      end

      context "When params are invalid" do
        before do
          post employers_path params: invalid_params
        end

        it "returns unprocessable entity status code" do
          expect(response).to have_http_status(422)
        end

        it "returns doesn't allow balnk name/location" do
          expect(json_response[:errors][:name]).to eq ["Name can't be blank"]
          expect(json_response[:errors][:location]).
            to eq ["Location can't be blank"]
        end
      end
    end

    describe "PUT /employer" do
      context "when params are valid" do
        it "updates employer" do
          put employer_path employer, params: update_params
          expect(response).to have_http_status(200)
          expect(json_response[:name]).to eq update_params[:employer][:name]
        end
      end

      context "when params are invalid" do
        it "returns errors" do
          put employer_path employer, params: invalid_params
          expect(response).to have_http_status(422)
          expect(json_response[:errors][:name]).to eq ["Name can't be blank"]
          expect(json_response[:errors][:location]).
            to eq ["Location can't be blank"]
        end
      end
    end

    describe "DELETE /employer" do
      it "deletes employer sucessfully" do
        delete employer_path employer
        expect(response).to have_http_status 204
      end
    end
  end
end
