class LocationsController < ApplicationController
  before_action :set_location, only: %i[ show edit update destroy ]

  # GET /locations or /locations.json
  def index
    @locations = current_user.locations.all

    if params[:query].present?
      @locations = @locations
        .where("name LIKE :query OR formatted_address LIKE :query", query: "%#{params[:query]}%")
        .limit(10)
      render partial: "search_results", layout: false if request.xhr?
      return
    end
  end

  # GET /locations/1 or /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @location = current_user.locations.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations or /locations.json
  def create
    @location = current_user.locations.new(location_params)

    respond_to do |format|
      if @location.save
        Samsara::AddressService.new(current_user).sync_address(@location)

        format.html { redirect_to @location, notice: "Location was successfully created." }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1 or /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        Samsara::AddressService.new(current_user).sync_address(@location)

        format.html { redirect_to @location, notice: "Location was successfully updated." }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1 or /locations/1.json
  def destroy
    @location.destroy!

    respond_to do |format|
      format.html { redirect_to locations_path, status: :see_other, notice: "Location was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def fetch
    Samsara::AddressService.new(current_user).fetch_addresses
    redirect_to locations_path, notice: "Locations fetched successfully."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = current_user.locations.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def location_params
      # Get the raw parameters
      permitted_params = params.require(:location).permit(
        :name,
        :formatted_address,
        :latitude,
        :longitude,
        :geofence
      )

      # Parse geofence JSON if present
      if permitted_params[:geofence].present?
        begin
          permitted_params[:geofence] = JSON.parse(permitted_params[:geofence])
        rescue JSON::ParserError => e
          Rails.logger.error "Failed to parse geofence JSON: #{e.message}"
          permitted_params[:geofence] = nil
        end
      end

      permitted_params
    end
end
