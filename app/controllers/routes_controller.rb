class RoutesController < ApplicationController
  before_action :set_route, only: %i[ show edit update destroy ]

  # GET /routes or /routes.json
  def index
    @routes = current_user.routes.all
  end

  # GET /routes/1 or /routes/1.json
  def show
  end

  # GET /routes/new
  def new
    @route = current_user.routes.new(
      scheduled_start_time: 2.hours.from_now,
      scheduled_end_time: 4.hours.from_now,
    )
  end

  # GET /routes/1/edit
  def edit
  end

  # POST /routes or /routes.json
  def create
    @route = current_user.routes.new(route_params)

    respond_to do |format|
      if @route.save
        Samsara::RouteService.new(current_user).sync_route(@route)

        format.html { redirect_to @route, notice: "Route was successfully created." }
        format.json { render :show, status: :created, location: @route }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /routes/1 or /routes/1.json
  def update
    respond_to do |format|
      if @route.update(route_params)
        Samsara::RouteService.new(current_user).sync_route(@route)

        format.html { redirect_to @route, notice: "Route was successfully updated." }
        format.json { render :show, status: :ok, location: @route }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routes/1 or /routes/1.json
  def destroy
    @route.destroy!

    respond_to do |format|
      format.html { redirect_to routes_path, status: :see_other, notice: "Route was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def fetch
    Samsara::RouteService.new(current_user).fetch_routes
    redirect_to routes_path, notice: "Routes fetched successfully"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_route
      @route = current_user.routes.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def route_params
      params.expect(route: [ :name, :scheduled_start_time, :scheduled_end_time, :actual_start_time, :actual_end_time, :settings, :driver_id, :vehicle_id, :user_id ])
    end
end
