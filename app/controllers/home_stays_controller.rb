class HomeStaysController < ApplicationController
  before_action :set_home_stay, only: %i[show update destroy]

  # GET /home_stays
  def index
    @home_stays = HomeStay.all

    render json: @home_stays
  end

  # GET /home_stays/1
  def show
    render json: @home_stay
  end

  # POST /home_stays
  def create
    @home_stay = HomeStay.new(home_stay_params)

    if @home_stay.save
      render json: @home_stay, status: :created, location: @home_stay
    else
      render json: @home_stay.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /home_stays/1
  def update
    if @home_stay.update(home_stay_params)
      render json: @home_stay
    else
      render json: @home_stay.errors, status: :unprocessable_entity
    end
  end

  # DELETE /home_stays/1
  def destroy
    @home_stay.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_home_stay
    @home_stay = HomeStay.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def home_stay_params
    params.require(:home_stay).permit(:name, :location, :description, :no_of_rooms, :rating, :price, :user_id)
  end
end
