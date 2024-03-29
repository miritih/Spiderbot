module Api
  module V1
    class JobsController < ApplicationController
      before_action :set_job, only: %i[show update destroy]

      # GET /jobs
      def index
        @jobs = Job.all
        render_response(@jobs, :ok)
      end

      # GET /jobs/1
      def show
        render_response(@job, :ok)
      end

      # POST /jobs
      def create
        @job = Job.new(job_params)

        if @job.save
          render_response(@job, :created)
        else
          render_error_response @job.errors
        end
      end

      # PATCH/PUT /jobs/1
      def update
        if @job.update(job_params)
          render_response(@job, :ok)
        else
          render_error_response @job.errors
        end
      end

      # DELETE /jobs/1
      def destroy
        @job.destroy
        render_response({}, :no_content)
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_job
        @job = Job.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def job_params
        params.require(:job).
          permit(
            :job_title, :job_location, :job_listing_url,
            :id_from_source, :job_city, :job_category,
            :job_employer, :job_type, :job_compensation,
            :job_description, :apply_to_email, :expire_date,
            :job_source_ad_target, :job_state, :job_country,
            :job_date, :postal_code
          )
      end
    end
  end
end
