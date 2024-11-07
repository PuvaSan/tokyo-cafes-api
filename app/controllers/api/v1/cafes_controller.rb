class Api::V1::CafesController < ApplicationController
  def index
    # if params[:title].present?
    #   @cafes = Cafe.where('title ILIKE ?', "%#{params[:title]}%")
    # else
    #   @cafes = Cafe.all
    # end

    # you can search based on title or id
    @cafes = if params[:title].present?
               Cafe.where('title ILIKE ?', "%#{params[:title]}%")
             elsif params[:id].present?
               Cafe.where(id: params[:id])
             else
               Cafe.all
             end
    # return json in descending order
    render json: @cafes.order(created_at: :desc)
  end

  def create
    @cafe = Cafe.new(cafe_params)

    if @cafe.save
      render json: @cafe, status: :created
    else
      render json: { errors: @cafe.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # def update

  # end
  private

  def cafe_params
    params.require(:cafe).permit(:title, :address, :picture, hours: {}, criteria: [])
  end
end
