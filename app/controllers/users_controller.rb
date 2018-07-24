class UsersController < ApplicationController

  # before_action :authenticate_user 
  def show
    if current_user
      @user = current_user
      render 'show.json.builder'
    else
      render json: {}
    end
  end

	def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.save
      render "show.json.jbuilder"
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
