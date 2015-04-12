class CalcsController < ApplicationController
  before_action :set_calc, only: [:show, :edit, :update, :destroy]

  # GET /calcs
  def index
    @asteroid = Asteroid.new
  end

  # GET /calcs/1
  def show
  end

  # GET /calcs/new
  def new
    @calc = Calc.new
  end

  # GET /calcs/1/edit
  def edit
  end

  # POST /calcs
  def create
    @calc = Calc.new(calc_params)

    if @calc.save
      redirect_to @calc, notice: 'Calc was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /calcs/1
  def update
    if @calc.update(calc_params)
      redirect_to @calc, notice: 'Calc was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /calcs/1
  def destroy
    @calc.destroy
    redirect_to calcs_url, notice: 'Calc was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calc
      @calc = Calc.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def calc_params
      params[:calc]
    end
end
