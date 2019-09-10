class EmployersController < ApplicationController
  before_action :set_employer, only: [:show, :update, :destroy]

  def index
    @employers = Employer.all
    render json: @employers
  end

  def show
    render json: @employer
  end

  def create
    @employer = Employer.new(employer_params)

    if @employer.save
      render json: @employer, status: :created, location: @employer
    else
      render json: @employer.errors, status: :unprocessable_entity
    end
  end

  def update
    if @employer.update(employer_params)
      render json: @employer
    else
      render json: @employer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @employer.destroy
  end

  private
    def set_employer
      @employer = Employer.find(params[:id])
    end

    def employer_params
      params.require(:employer).permit(:name, :location, :employer_type, :sector)
    end
end
