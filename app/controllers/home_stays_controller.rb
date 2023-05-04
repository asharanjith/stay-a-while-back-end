class HomeStaysController < ApplicationController
  before_action :set_home_stay, only: %i[show update destroy]

  # GET /home_stays
  def index
    home_stays = HomeStay.includes(:images)
    home_stays_list = home_stays.where(user_id: current_user_id)
    render json: { data: { home_stays: home_stays_list.as_json(include: :images) } }, status: :ok
  end

  # GET /home_stays/1
  def show
    home_stay = HomeStay.find_by(id: params[:id]).as_json(include: :images)
    render json: { data: { home_stays: home_stay } }, status: :ok
  end

  # POST /home_stays
  def create
    home_stay = HomeStay.new(home_stay_params.merge(user_id: current_user_id))

    if home_stay.save
      new_id = @home_stay.id
      @images = params[:images].map { |image| { home_stay_id: new_id, url: image } }
      Image.insert_all(@images)

      render json: {
        operation: 'success',
        data: {
          home_stay_id: home_stay.id
        }
      }, status: :created
    else
      render json: {
        operation: 'failed',
        data: {
          errors: home_stay.errors.full_messages
        }
      }, status: :unprocessable_entity
    end
  end

  # DELETE /home_stays/1
  def destroy
    home_stay = HomeStay.find_by(id: params[:id], user_id: current_user_id)
    if home_stay & home_stay.destroy
      render json: {
        operation: 'success',
        data: {
          message: 'Home stay deleted successfully'
        }
      }, status: :ok
    else
      render json: {
        operation: 'failed',
        data: {
          message: 'Home stay not found'
        }
      }, status: :not_found
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def home_stay_params
    params.require(:home_stay).permit(:name, :location, :description, :no_of_rooms, :rating, :price, :images, :user_id)
  end
end
