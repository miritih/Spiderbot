require "rails_helper"

RSpec.describe "Jobs", type: :request do
  describe "Jobs requests" do
    let!(:job) { create :job }
    let!(:employer) { create :employer }
    let(:valid_params) do
      {
        job: {
          job_title: "MyString",
          job_location: "MyString",
          job_type: "",
          id_from_source: "MyString",
          job_city: "",
          job_category: "MyString",
          job_compensation: "MyString",
          expire_date: "MyString",
          job_employer: employer.name,
          job_listing_url: "MyString",
          apply_to_email: "MyString",
          job_description: "MyString",
          job_source_ad_target: "MyString",
          job_state: "MyString",
          job_country: "MyString",
          job_date: "MyString",
          postal_code: "MyString"
        }
      }
    end

    let(:invalid_params) do
      {
        job: {
          job_title: "",
          job_location: ""
        }
      }
    end

    let(:update_params) do
      {
        job: {
          job_title: "Update MyString",
          job_location: "Update MyString",
          job_description: "Update MyText",
          job_employer: "employer"
        }
      }
    end

    describe "GET /jobs" do
      it "returns all import jobs" do
        get jobs_path
        expect(response).to have_http_status(200)
        expect(json_response[:data].first[:attributes][:job_title]).
          to eq job.job_title
      end
    end

    describe "Get /jobs/:id" do
      it "returns the requested import job" do
        get job_path job
        expect(response).to have_http_status(200)
        expect(json_response[:job_title]).to eq job.job_title
      end
    end

    describe "Post /jobs" do
      context "When params are valid" do
        before do
          post jobs_path params: valid_params
        end

        it "creates job sucessfully" do
          expect(response).to have_http_status(201)
        end

        it "returns the created job" do
          expect(json_response[:job_title]).
            to eq valid_params[:job][:job_title]
        end
      end

      context "When params are invalid" do
        before do
          post jobs_path params: invalid_params
        end

        it "returns unproccesable entity code" do
          expect(response).to have_http_status(422)
        end

        it "returns errors" do
          expect(json_response[:errors][:job_title]).
            to eq ["Job title can't be blank"]
        end
      end
    end

    describe "PUT /job" do
      context "when params are valid" do
        it "updates jobs" do
          put job_path job, params: update_params
          expect(response).to have_http_status(200)
          expect(json_response[:job_title]).
            to eq update_params[:job][:job_title]
        end
      end

      context "when params are invalid" do
        it "returns errors" do
          put job_path job, params: invalid_params
          expect(response).to have_http_status(422)
          expect(json_response[:errors][:job_title]).
            to eq ["Job title can't be blank"]
          expect(json_response[:errors][:job_location]).
            to eq ["Job location can't be blank"]
        end
      end
    end

    describe "DELETE /job" do
      it "deletes import job sucessfully" do
        delete job_path job
        expect(response).to have_http_status 204
      end
    end
  end
end
