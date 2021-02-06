class DragonsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_dragon, only: %i[show edit update destroy]

  def show
    @unavailable_dates = []
    @dragon.bookings.each do |booking|
      @unavailable_dates << {from: booking.start_date.strftime('%Y-%m-%d'),
                             to: booking.end_date.strftime('%Y-%m-%d')
                            }
    end
  end

  def new
    @dragon = Dragon.new
  end

  def create
    @dragon = Dragon.new(dragon_params)
    @dragon.user = current_user
    if @dragon.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @dragon = Dragon.update(dragon_params)
    redirect_to root_path
  end

  private

  def dragon_params
    params.require(:dragon).permit(:nickname, :country, :size, :speed, :description, :photo)
  end

  def set_dragon
    @dragon = Dragon.find(params[:id])
  end
end
