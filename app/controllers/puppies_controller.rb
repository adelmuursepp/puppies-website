class PuppiesController < ApplicationController
  before_action :set_puppy, only: [ :show, :listing, :book ]
  skip_before_action :authenticate_user!, only: [ :show ]

  def index
    @puppies = Puppy.where.not(latitude: nil, longitude: nil)
    if params[:query].present?
      @puppies = @puppies.search_by_breed_and_name(params[:query])
    else
      @puppies = Puppy.all
    end


    @markers = @puppies.map do |puppy|
      {
        lat: puppy.latitude,
        lng: puppy.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { puppy: puppy })
      }
    end
  end

  def new
    @puppy = Puppy.new
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

  def booked
    @booked_puppies = current_user.taking_puppies
    @puppies = Puppy.where.not(latitude: nil, longitude: nil)
    @markers = @puppies.map do |puppy|
      {
        lat: puppy.latitude,
        lng: puppy.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { puppy: puppy })
      }
    end
  end
  def set_puppy
    @puppy = Puppy.find(params["id"])
  end

  def destroy
   @puppy = Puppy.find(params[:id])
   @puppy.destroy
   redirect_to root_path
 end

 def puppy_attributes
  params.require(:puppy).permit(:name, :breed, :age, :photo, :address )
end

end
