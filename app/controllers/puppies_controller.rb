class PuppiesController < ApplicationController
  before_action :set_puppy, only: [ :show, :listing ]

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
  end
  def set_puppy
    @puppy = Puppy.find(params["id"])
  end

  def puppy_attributes
    params.require(:puppy).permit(:name, :breed, :age, :photo )
  end

end
