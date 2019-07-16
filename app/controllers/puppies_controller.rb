class PuppiesController < ApplicationController
  before_action :set_puppy, only: [ :show, :listing, :book ]

  def new
    if user_signed_in?
      @puppy = Puppy.new
    else
      redirect_to new_user_registration_path
    end
  end

  def show
  end

  def create
    @puppy = Puppy.new(puppy_attributes)
    @puppy.user = current_user
    if @puppy.save
      redirect_to listing_puppy_path(@puppy.id)
    else
      render :new
    end
  end

  def listing
  end

  def book
    @booking = Booking.new(puppy: @puppy, user: current_user)
    if @booking.save
      redirect_to root_path
    else
      render :show
    end
  end
  def set_puppy
    @puppy = Puppy.find(params["id"])
  end

  def puppy_attributes
    params.require(:puppy).permit(:name, :breed, :age, :photo )
  end

end
