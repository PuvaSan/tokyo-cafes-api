class Api::V1::CafesController < ApplicationController
  def index
    if params[:title].present?
      @cafes = Cafe.where('title ILIKE ?', "%#{params[:title]}%")
    else
      @cafes = Cafe.all
    end

    # return json in descending order
    render json: @cafes
  end

  # def create

  # end

  # def update

  # end
end
