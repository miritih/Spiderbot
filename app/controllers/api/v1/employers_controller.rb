module Api
  module V1
    class EmployersController < ApplicationController
      before_action :set_employer, only: %i[show update destroy]

      def index
        @employers = Employer.all
        render_response @employers
      end

      def show
        render_response @employer
      end

      def create
        @employer = Employer.new(employer_params)
        if @employer.save
          render_response(@employer, :created)
        else
          render_error_response @employer.errors
        end
      end

      def update
        if @employer.update(employer_params)
          render_response(@employer)
        else
          render_error_response @employer.errors
        end
      end

      def destroy
        @employer.destroy
        render_response({}, :no_content)
      end

      private

      def set_employer
        @employer = Employer.find(params[:id])
      end

      def employer_params
        params.require(:employer).
          permit(:name, :location, :employer_type, :sector)
      end
    end
  end
end
