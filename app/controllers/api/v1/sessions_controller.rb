require 'bcrypt'

class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: user_params[:email])
    if user.authenticate(user_params[:password]) && user
      session[:user_id] = user.id

      render json: UsersSerializer.new(user)
    else
      render json: "Invalid credentials.", status: 401
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end