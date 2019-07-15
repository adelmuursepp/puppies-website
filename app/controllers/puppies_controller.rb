class PuppiesController < ApplicationController
  def new
    @puppy = Puppy.new
  end

  def show
    @puppy = Puppy.find(params[:id])
  end

  def create
    redirect_to listing_puppy_path(1)
  end
end
