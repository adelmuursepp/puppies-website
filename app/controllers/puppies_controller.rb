class PuppiesController < ApplicationController
  def new
  end

  def create
    redirect_to listing_puppy_path(1)
  end
end
