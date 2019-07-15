class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private
# Overwriting the sign_out redirect path method
  def after_sign_in_path_for(resource_or_scope)
    new_puppies_path
  end
end
