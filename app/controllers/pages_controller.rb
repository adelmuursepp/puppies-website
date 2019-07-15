class PagesController < ApplicationController
  skip_before_action :authenticate!, only: :home
  def home
  end
end
