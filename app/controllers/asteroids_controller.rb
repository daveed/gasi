class AsteroidsController < ApplicationController
  before_action :set_asteroid, only: [:show, :edit, :update, :destroy]

  attr_accessor :mass

  # GET /asteroids
  def index
    @asteroids = Asteroid.all
    @asteroid  = Asteroid.new
  end

  # GET /asteroids/1
  def show
    @asteroids = Mpc.calc_mass_fuel_total(@asteroid.mass).slice(0,10)
  end

  # GET /asteroids/new
  def new
    @asteroid = Asteroid.new
  end

  # GET /asteroids/1/edit
  def edit
  end

  # POST /asteroids
  def create
    @asteroid = Asteroid.new(asteroid_params)

    if @asteroid.save
      redirect_to @asteroid
    else
      render :new
    end
  end

  # PATCH/PUT /asteroids/1
  def update
    if @asteroid.update(asteroid_params)
      redirect_to @asteroid
    else
      render :edit
    end
  end

  # DELETE /asteroids/1
  def destroy
    @asteroid.destroy
    redirect_to asteroids_url, notice: 'Asteroid was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asteroid
      @asteroid = Asteroid.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def asteroid_params
      params.require(:asteroid).permit(:mass)
    end
end
