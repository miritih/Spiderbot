class ImportConfigsController < ApplicationController
  before_action :set_import_config, only: [:show, :update, :destroy]

  # GET /import_configs
  def index
    @import_configs = ImportConfig.all

    render json: @import_configs
  end

  # GET /import_configs/1
  def show
    render json: @import_config
  end

  # POST /import_configs
  def create
    @import_config = ImportConfig.new(import_config_params)

    if @import_config.save
      render json: @import_config, status: :created, location: @import_config
    else
      render json: @import_config.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /import_configs/1
  def update
    if @import_config.update(import_config_params)
      render json: @import_config
    else
      render json: @import_config.errors, status: :unprocessable_entity
    end
  end

  # DELETE /import_configs/1
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
      params.require(:import_config).permit(:job_title, :location)
    end
end
