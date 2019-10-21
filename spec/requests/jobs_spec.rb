require "rails_helper"

RSpec.describe "Jobs", type: :request do

  describe "Jobs requests" do
    let!(:job){create :job}
    let!(:employer){create :employer}
    let(:valid_params) do
      {
        job: {
          title:"MyString",
          location: "MyString",
          description: "MyText",
          job_type: "",
          link: "MyString",
          department: "MyString",
          apply_link: "MyString",
          apply_email: "MyString",
          employer_id: employer.id
        }
      }
    end

    let(:invalid_params) do
      {
        job: {
          title: "",
          location: "",
        }
      }
    end

    let(:update_params) do
      {
        job: {
          title: "Update MyString",
          location: "Update MyString",
          description: "Update MyText",
          employer: employer
        }
      }
    end

    describe "GET /jobs" do
      it "returns all import jobs" do
        get jobs_path
        expect(response).to have_http_status(200)
        expect(json_response.first[:title]).to eq job.title
      end
    end

    describe "Get /imoport_cofig/:id" do
      it "returns the requested import job" do
        get job_path job
        expect(response).to have_http_status(200)
        expect(json_response[:title]).to eq job.title
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

          expect(json_response[:title]).
            to eq valid_params[:job][:title]
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
          expect(json_response[:title]).
            to eq ["Title can't be blank"]
        end
      end
    end

    describe "PUT /job" do
      context "when params are valid" do
        it "updates jobs" do
          put job_path job, params: update_params
          expect(response).to have_http_status(200)
          expect(json_response[:title]).
            to eq update_params[:job][:title]
        end
      end

      context "when params are invalid" do
        it "returns errors" do
          put job_path job, params: invalid_params
          expect(response).to have_http_status(422)
          expect(json_response[:title]).
            to eq ["Title can't be blank"]
          expect(json_response[:location]).
            to eq ["Location can't be blank"]
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
