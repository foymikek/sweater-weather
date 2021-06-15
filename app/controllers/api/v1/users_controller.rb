class Api::V1::UsersController < ApplicationController
  def create
    if params[:password] == params[:password_confirmation]
      user = User.new(user_params)
      user.create_key
      if user.save
        render json: UsersSerializer.new(user)
      else
        render json: "Invalid Credentials", status: 400
      end
    else
      render json: "Invalid password confirmation, please try again.", status: 401
    end 
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end