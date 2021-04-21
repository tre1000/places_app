class Api::PlacesController < ApplicationController
  def index
    @places = Place.all
    render "index.json.jb"
  end

  def show
    @place = Place.find(params[:id])
    render "show.json.jb"
  end

  def create
    @place = Place.new({
      name: params[:name],
      address: params[:address],
    })
    if @place.save
      render json: { message: "place successfully added"}, status: 200
    else
      render json: { errors: @place.errors.full_messages }, status: 400
    end
  end

  def update
    @place = Place.find(params[:id])
    @place.name = params[:name] || @place.name
    @place.address = params[:address] || @place.address

    if @place.save
      render json: { message: "place successfully updated"}, status: 200
    else
      render json: { errors: @place.errors.full_messages }, status: 400
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.delete
    render json: { message: "Place successfully deleted."}, status: 200
  end
end
