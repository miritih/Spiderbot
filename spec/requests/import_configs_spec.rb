RSpec.describe "ImportConfigs", type: :request do
  describe "import config requests" do
    let!(:import_config) { create :import_config }
    let(:valid_params) do
      {
        import_config: {
          jobs_page_url: Faker::Internet.domain_name,
          home_page: Faker::Internet.domain_name,
          employer_override: "Test Employer",
          location_override: "",
          config_name: "Test1 Config",
          job_count: 5,
          first_page: {
            JOB_TITLE: "(//div[@class=\"opening\"]/a)[1]",
            JOB_LOCATION: "(//div[@class=",
            JOB_LISTING_URL: "(//div[@class=\"opening\"]/a)[1]",
            ID_FROM_SOURCE: "(//div[@class=\"opening\"]/a)[1]"
          },
          second_page: {
            JOB_DESCRIPTION: "//div[@id=\"content\"]"
          }
        }
      }
    end

    let(:invalid_params) do
      {
        import_config: {
          config_name: "",
          description: "",
          jobs_page_url: ""
        }
      }
    end

    let(:update_params) do
      {
        import_config: {
          jobs_page_url: Faker::Internet.domain_name,
          home_page: Faker::Internet.domain_name,
          config_name: "updated name",
          first_page: {
            JOB_TITLE: Faker::Job.title,
            JOB_LOCATION: Faker::Job.title,
            JOB_LISTING_URL: "//div",
            ID_FROM_SOURCE: "//div"
          },
          second_page: {
            JOB_DESCRIPTION: "//div"
          }
        }
      }
    end

    describe "GET /import_configs" do
      it "returns all import configs" do
        get import_configs_path
        expect(response).to have_http_status(200)
        title = json_response.first[:first_page][:JOB_TITLE]
        expect(title).to eq import_config.first_page["JOB_TITLE"]
      end
    end

    describe "Get /imoport_cofig/:id" do
      it "returns the requested import config" do
        get import_config_path import_config
        expect(response).to have_http_status(200)
        title = json_response[:first_page][:JOB_TITLE]
        expect(title).to eq import_config.first_page["JOB_TITLE"]
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
          expect(json_response[:first_page][:JOB_TITLE]).
            to eq valid_params[:import_config][:first_page][:JOB_TITLE]
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
          expect(json_response[:errors][:first_page]).
            to eq ["First page can't be blank"]

          expect(json_response[:errors][:jobs_page_url]).
            to eq ["Jobs page url can't be blank"]

          expect(json_response[:errors][:home_page]).
            to eq ["Home page can't be blank"]

          expect(json_response[:errors][:config_name]).
            to eq ["Config name can't be blank"]
        end
      end
    end

    describe "PUT /import_config" do
      context "when params are invalid" do
        it "returns errors" do
          put import_config_path import_config, params: invalid_params
          expect(response).to have_http_status(422)
          expect(json_response[:errors][:jobs_page_url]).
            to eq ["Jobs page url can't be blank"]

          expect(json_response[:errors][:config_name]).
            to eq ["Config name can't be blank"]
        end
      end

      context "when params are valid" do
        it "updates import_configs" do
          put import_config_path import_config, params: update_params
          expect(response).to have_http_status(200)
          expect(json_response[:first_page][:JOB_TITLE]).
            to eq update_params[:import_config][:first_page][:JOB_TITLE]
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
