class BookingsController < ApplicationController

def new
  @dragon = Dragon.find(params[:dragon_id])
  @booking = Booking.new
end


  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @dragon = Dragon.find(params[:dragon_id])
    @booking.dragon = @dragon
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:end_date, :start_date)
  end

end
