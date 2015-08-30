class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]
  before_action :set_car

  def index
    @rentals = Rental.all
  end

  def show
  end

  def new
    @rental = @car.rentals.new
  end

  def edit
  end

  def create
    @rental = @car.rentals.new(rental_params)

    respond_to do |format|
      if @rental.save
        format.html { redirect_to car_rental_path(@rental.car, @rental), notice: 'Rental was successfully created.' }
        format.json { render :show, status: :created, location: @rental }
      else
        format.html { render :new }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @rental.update(rental_params)
        format.html { redirect_to car_rental_path(@rental.car, @rental), notice: 'Rental was successfully updated.' }
        format.json { render :show, status: :ok, location: @rental }
      else
        format.html { render :edit }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rental.destroy
    respond_to do |format|
      format.html { redirect_to car_rentals_url, notice: 'Rental was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_rental
      @rental = Rental.find(params[:id])
    end

    def set_car
      @car = Car.find(params[:car_id])
    end

    def rental_params
      params.require(:rental).permit(:starts_on, :ends_on, :car)
    end
end
