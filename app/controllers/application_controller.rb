class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role])

    # For additional in app/views/devise/registrations/edit.html.erb
    # devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def unavailable_dates(dragon)
    @unavailable_dates = []
    dragon.bookings.each do |booking|
      @unavailable_dates << {from: booking.start_date.strftime('%Y-%m-%d'),
                             to: booking.end_date.strftime('%Y-%m-%d')
                            }
    end
  end

end
