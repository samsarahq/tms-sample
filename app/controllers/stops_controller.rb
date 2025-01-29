class StopsController < ApplicationController
  before_action :set_stop, only: %i[ show edit update destroy ]

  # GET /stops or /stops.json
  def index
    @stops = Stop.all
  end

  # GET /stops/1 or /stops/1.json
  def show
  end

  # GET /stops/new
  def new
    @route = Route.find(params.expect(:route_id))
    @stop = @route.stops.new
  end

  # GET /stops/1/edit
  def edit
    @route = Route.find(params.expect(:route_id))
    @stop = @route.stops.find(params.expect(:id))
  end

  # POST /stops or /stops.json
  def create
    @route = Route.find(params.expect(:route_id))
    @stop = @route.stops.new(stop_params)

    respond_to do |format|
      if @stop.save
        Samsara::RouteService.new(current_user).sync_route(@stop.route)

        format.html { redirect_to @route, notice: "Stop was successfully created." }
        format.json { render :show, status: :created, location: @stop }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stops/1 or /stops/1.json
  def update
    respond_to do |format|
      if @stop.update(stop_params)
        Samsara::RouteService.new(current_user).sync_route(@stop.route)

        format.html { redirect_to @stop.route, notice: "Stop was successfully updated." }
        format.json { render :show, status: :ok, location: @stop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stops/1 or /stops/1.json
  def destroy
    @stop.destroy!

    respond_to do |format|
      format.html { redirect_to route_path(@stop.route), status: :see_other, notice: "Stop was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stop
      @stop = Stop.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def stop_params
      params.expect(stop: [ :samsara_id, :scheduled_arrival_time, :scheduled_departure_time, :actual_arrival_time, :actual_departure_time, :en_route_time, :state, :live_sharing_url, :notes, :route_id, :location_id ])
    end
end
