class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %i[login create]

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(name: params[:name])
    if @user
      token = jwt_encode({ user_id: @user.id })
      render json: { token:, user: @user.name }
    else
      render json: { error: 'Invalid name' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
