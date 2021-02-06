class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @dragons = Dragon.all

    @markers = @dragons.geocoded.map do |dragon|
      {
        lat: dragon.latitude,
        lng: dragon.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { dragon: dragon }),
        image_url: helpers.asset_url('default_dragon_pic.jpg')

      }
    end
  end
end
