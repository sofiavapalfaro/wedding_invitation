class GuestsController < ApplicationController
  def show
    @guest = Guest.find_by(token: params[:token])
    if @guest
      # Render the invitation page with the guest's name and other details
    else
      # Handle cases where the token is invalid (e.g., show a 404 page)
      render 'not_found'
    end
  end
end
