class DriversController < ApplicationController
  before_action :set_driver, only: %i[ show edit update destroy ]

  # GET /drivers or /drivers.json
  def index
    @drivers = current_user.drivers.all
  end

  # GET /drivers/1 or /drivers/1.json
  def show
  end

  # GET /drivers/new
  def new
    @driver = current_user.drivers.new(
      status: :active,
      name: Faker::Name.name,
      username: Faker::Internet.username,
      password: Faker::Internet.password,
      phone_number: PhonyRails.normalize_number(Faker::PhoneNumber.phone_number, country_code: 'US')
    )
  end

  # GET /drivers/1/edit
  def edit
  end

  # POST /drivers or /drivers.json
  def create
    @driver = current_user.drivers.new(driver_params)

    respond_to do |format|
      if @driver.save
        Samsara::DriverService.new(current_user).sync_driver(@driver)

        format.html { redirect_to @driver, notice: "Driver was successfully created." }
        format.json { render :show, status: :created, location: @driver }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drivers/1 or /drivers/1.json
  def update
    respond_to do |format|
      if @driver.update(driver_params)
        Samsara::DriverService.new(current_user).sync_driver(@driver)

        format.html { redirect_to @driver, notice: "Driver was successfully updated." }
        format.json { render :show, status: :ok, location: @driver }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drivers/1 or /drivers/1.json
  def destroy
    Samsara::DriverService.new(current_user).deactivate_driver(@driver)

    @driver.update!(status: :deactivated)

    respond_to do |format|
      format.html { redirect_to drivers_path, status: :see_other, notice: "Driver was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def fetch
    Samsara::DriverService.new(current_user).fetch_drivers

    redirect_to drivers_path, notice: "Drivers fetched from Samsara."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver
      @driver = current_user.drivers.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def driver_params
      params.expect(driver: [ :name, :username, :password, :samsara_id, :phone_number, :status ])
    end
end
