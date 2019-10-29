module Api
  module V1
    class ImportConfigsController < ApplicationController
      before_action :set_import_config, only: %i[show update destroy]

      def index
        @import_configs = ImportConfig.all
        render_response @import_configs do |resource, status|
          render json: resource, status: status
        end
      end

      def show
        render_response @import_config
      end

      def create
        @import_config = ImportConfig.new(import_config_params)

        if @import_config.save
          render_response(@import_config, :created)
        else
          render_error_response(@import_config.errors, :unprocessable_entity)
        end
      end

      def update
        if @import_config.update(import_config_params)
          render_response @import_config
        else
          render_error_response(@import_config.errors, :unprocessable_entity)
        end
      end

      def destroy
        @import_config.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_import_config
        @import_config = ImportConfig.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def import_config_params
        params.require(:import_config).permit(:employer_override, :job_count,
                                              :jobs_page_url, :home_page,
                                              :location_override, :config_name,
                                              seed_click: {},first_page: {},
                                              second_page: {}, next_page: {})
      end
    end
  end
end
