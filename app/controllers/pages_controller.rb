class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @dragons = Dragon.all
  end
end
