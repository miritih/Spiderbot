RSpec.describe "ImportConfigs", type: :request do
  describe "import config requests" do
    let!(:import_config) { create :import_config }
    let(:valid_params) do
      {
        import_config: {
          job_title: Faker::Job.title,
          description: Faker::Lorem.paragraph,
          job_link: Faker::Internet.domain_name,
          job_type: Faker::Job.employment_type,
          department: Faker::Job.field,
          apply_link: Faker::Internet.domain_name,
          start_url: Faker::Internet.domain_name,
          email: Faker::Internet.email,
          employer: Faker::Company.name
        }
      }
    end

    let(:invalid_params) do
      {
        import_config: {
          job_title: "",
          description: "",
          job_link: ""
        }
      }
    end

    let(:update_params) do
      {
        import_config: {
          job_title: Faker::Job.title,
          description: Faker::Lorem.paragraph,
          job_link: Faker::Internet.domain_name
        }
      }
    end

    describe "GET /import_configs" do
      it "returns all import configs" do
        get import_configs_path
        expect(response).to have_http_status(200)
        expect(json_response.first[:job_title]).to eq import_config.job_title
      end
    end

    describe "Get /imoport_cofig/:id" do
      it "returns the requested import config" do
        get import_config_path import_config
        expect(response).to have_http_status(200)
        expect(json_response[:job_title]).to eq import_config.job_title
      end
    end

    describe "Post /import_configs" do
      context "When params are valid" do
        before do
          post import_configs_path params: valid_params
        end

        it "creates config sucessfully" do
          expect(response).to have_http_status(201)
        end

        it "returns the created config" do
          expect(json_response[:job_title]).
            to eq valid_params[:import_config][:job_title]
        end
      end

      context "When params are invalid" do
        before do
          post import_configs_path params: invalid_params
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

    describe "PUT /import_config" do
      context "when params are valid" do
        it "updates import_configs" do
          put import_config_path import_config, params: update_params
          expect(response).to have_http_status(200)
          expect(json_response[:job_title]).
            to eq update_params[:import_config][:job_title]
        end
      end

      context "when params are invalid" do
        it "returns errors" do
          put import_config_path import_config, params: invalid_params
          expect(response).to have_http_status(422)
          expect(json_response[:errors][:job_title]).
            to eq ["Job title can't be blank"]
          expect(json_response[:errors][:description]).
            to eq ["Description can't be blank"]
        end
      end
    end

    describe "DELETE /import_config" do
      it "deletes import config sucessfully" do
        delete import_config_path import_config
        expect(response).to have_http_status 204
      end
    end
  end
end
