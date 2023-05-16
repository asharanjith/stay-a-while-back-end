class HomeStaysController < ApplicationController
  # GET /home_stays
  def index
    home_stays_list = HomeStay.includes(:images)
    home_stays_list = home_stays_list.where(user: @current_user) if params[:my_home_stays] == 'true'
    render json: { data: { home_stays: home_stays_list.as_json(include: :images) } }, status: :ok
  end

  # GET /home_stays/1
  def show
    home_stay = HomeStay.find_by(id: params[:id]).as_json(include: :images)
    render json: { data: { home_stays: home_stay } }, status: :ok
  end

  # POST /home_stays
  def create
    @home_stay = HomeStay.new(home_stay_params.merge(user: @current_user))

    if @home_stay.save
      @images = params[:images].map { |image| { url: image } }
      @home_stay.images.insert_all(@images)

      render json: {
        operation: 'success',
        data: {
          home_stay_id: @home_stay.id
        }
      }, status: :created
    else
      render json: {
        operation: 'failed',
        data: {
          errors: @home_stay.errors.full_messages
        }
      }, status: :unprocessable_entity
    end
  end

  # DELETE /home_stays/1
  def destroy
    home_stay = HomeStay.find_by(id: params[:id], user: @current_user)
    if home_stay&.destroy
      render json: { operation: "Home deleted successfully with id #{home_stay.id}" }, status: :ok
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
    params.require(:home_stay).permit(:name, :location, :description, :no_of_rooms, :rating, :price)
  end
end
