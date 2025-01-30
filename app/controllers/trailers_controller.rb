class TrailersController < ApplicationController
  before_action :set_trailer, only: %i[ show edit update destroy ]

  # GET /trailers or /trailers.json
  def index
    @trailers = current_user.trailers.all
  end

  # GET /trailers/1 or /trailers/1.json
  def show
  end

  # GET /trailers/new
  def new
    @trailer = current_user.trailers.new(
      make: Faker::Vehicle.make,
      model: Faker::Vehicle.model,
      year: Faker::Vehicle.year,
      vin: Faker::Vehicle.vin,
      license_plate: Faker::Vehicle.license_plate,
    )
  end

  # GET /trailers/1/edit
  def edit
  end

  # POST /trailers or /trailers.json
  def create
    @trailer = current_user.trailers.new(trailer_params)

    respond_to do |format|
      if @trailer.save
        Samsara::TrailersService.new(current_user).sync_trailer(@trailer)
        format.html { redirect_to @trailer, notice: "Trailer was successfully created." }
        format.json { render :show, status: :created, location: @trailer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trailers/1 or /trailers/1.json
  def update
    respond_to do |format|
      if @trailer.update(trailer_params)
        Samsara::TrailersService.new(current_user).sync_trailer(@trailer)
        format.html { redirect_to @trailer, notice: "Trailer was successfully updated." }
        format.json { render :show, status: :ok, location: @trailer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trailers/1 or /trailers/1.json
  def destroy
    @trailer.destroy!

    respond_to do |format|
      format.html { redirect_to trailers_path, status: :see_other, notice: "Trailer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def fetch
    Samsara::TrailersService.new(current_user).fetch_trailers
    redirect_to trailers_path, notice: "Trailers fetched successfully."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trailer
      @trailer = current_user.trailers.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def trailer_params
      params.expect(trailer: [ :name, :make, :model, :notes, :vin, :year, :license_plate ])
    end
end
