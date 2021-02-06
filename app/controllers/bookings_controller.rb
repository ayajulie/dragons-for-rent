class BookingsController < ApplicationController

def new
  @booking = Booking.new
end


  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.dragon = Dragon.find(1)
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy 
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:end_date, :start_date)
  end

end
