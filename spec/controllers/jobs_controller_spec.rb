require "rails_helper"

RSpec.describe JobsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Job. As you add validations to Job, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip("Add a hash of attributes valid for your model")
  end

  let(:invalid_attributes) do
    skip("Add a hash of attributes invalid for your model")
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # JobsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Job.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      Job.create! valid_attributes
      get :show, params: { id: job.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Job" do
        expect do
          post :create, params: { job: valid_attributes },
                        session: valid_session
        end.to change(Job, :count).by(1)
      end

      it "renders a JSON response with the new job" do
        post :create, params: { job: valid_attributes },
                      session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq("application/json")
        expect(response.location).to eq(job_url(Job.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new job" do
        post :create, params: { job: invalid_attributes },
                      session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        skip("Add a hash of attributes valid for your model")
      end

      it "updates the requested job" do
        job = Job.create! valid_attributes
        put :update, params: { id: job.to_param, job: new_attributes },
                     session: valid_session
        job.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the job" do
        job = Job.create! valid_attributes

        put :update, params: { id: job.to_param, job: valid_attributes },
                     session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq("application/json")
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the job" do
        job = Job.create! valid_attributes

        put :update, params: { id: job.to_param, job: invalid_attributes },
                     session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested job" do
      job = Job.create! valid_attributes
      expect do
        delete :destroy, params: { id: job.to_param }, session: valid_session
      end.to change(Job, :count).by(-1)
    end
  end
end
