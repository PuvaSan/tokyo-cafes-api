class Api::V1::CafesController < ApplicationController
  def index
    # if params[:title].present?
    #   @cafes = Cafe.where('title ILIKE ?', "%#{params[:title]}%")
    # else
    #   @cafes = Cafe.all
    # end

    @cafes = params[:title].present? ? Cafe.where('title ILIKE ?', "%#{params[:title]}%") : Cafe.all

    # return json in descending order
    render json: @cafes.order(created_at: :desc)
  end

  def create
    @cafe = Cafe.new(cafe_params)
  end

  # def update

  # end
  private

  def cafe_params
    params.require(:cafe).permit(:title, :address, :picture, hours: {}, criteria: [])
  end
end
