class PuppiesController < ApplicationController
  def new
    @puppy = Puppy.new
  end

  def show
    @puppy = Puppy.find(params[:id])
  end

  def create
    @puppy = Puppy.new(puppy_attributes)
    @puppy.user = current_user
    if @puppy.save
      redirect_to listing_puppy_path(1)
    else
      render :new
    end
  end

  def puppy_attributes
    params.require(:puppy).permit(:name, :breed, :age)
  end

end
