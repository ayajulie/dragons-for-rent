class BookingsController < ApplicationController
  def new
    @dragon = Dragon.find(params[:dragon_id])
    @booking = Booking.new
    unavailable_dates(@dragon)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @dragon = Dragon.find(params[:dragon_id])
    @booking.dragon = @dragon
    if @booking.save
      redirect_to dragon_path(@booking.dragon)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @dragon = @booking.dragon
    @unavailable_dates = []
    @dragon.bookings.each do |booking|
      @unavailable_dates << {from: booking.start_date.strftime('%Y-%m-%d'),
                             to: booking.end_date.strftime('%Y-%m-%d')
                            }
    end
    booking_dates = {from: @booking.start_date.strftime('%Y-%m-%d'),
                      to: @booking.end_date.strftime('%Y-%m-%d')
                    }
   @unavailable_dates.delete(booking_dates)
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to dragon_path(@booking.dragon)
    else
      render :edit
    end
# >>>>>>> af79964cf9ebe0e95ad7b8e7a0b34c78ced3c33c
  end

  private

  def booking_params
    params.require(:booking).permit(:end_date, :start_date, :user_id, :dragon_id)
  end

end
