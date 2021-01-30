class DragonsController < ApplicationController
skip_before_action :authenticate_user!, only: :show

  def show
    @dragon = Dragon.find(params[:id])
  end

  def new
    @dragon = Dragon.new
  end

  def create
  end

end
