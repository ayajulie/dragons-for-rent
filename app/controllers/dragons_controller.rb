class DragonsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]
  before_action :set_dragon, only: %i[show edit update destroy]

  def index
    @dragons = Dragon.search(params[:search])

    @markers = @dragons.geocoded.map do |dragon|
      {
        lat: dragon.latitude,
        lng: dragon.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { dragon: dragon }),
        image_url: helpers.asset_url('default_dragon_pic.jpg')
      }
    end
  end

  def show
    unavailable_dates(@dragon)
  end

  def new
    @dragon = Dragon.new
  end

  def create
    @dragon = Dragon.new(dragon_params)
    @dragon.user = current_user
    if @dragon.save
      redirect_to dragon_path(@dragon, tab: "current")
    else
      render :new
    end
  end

  def edit
  end

  def update
    @dragon.update(dragon_params)
    redirect_to dragon_path(@dragon, tab: "current")
  end

  private

  def dragon_params
    params.require(:dragon).permit(:nickname, :country, :size, :speed, :description, :search, :photo)
  end

  def set_dragon
    @dragon = Dragon.find(params[:id])
  end
end
