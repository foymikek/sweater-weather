class Api::V1::SessionsController < ApplicationController
  def create
    require 'pry'; binding.pry
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end