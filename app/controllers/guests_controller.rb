class GuestsController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :create, :update, :destroy]
  before_action :check_admin_role, only: [:index, :create, :update, :destroy]
  before_action :set_guest, only: [:show, :edit, :update, :destroy, :rsvp] # Set the guest for the actions

  def show
    # Información del evento
    @wedding_date = "2024-10-15"
    @wedding_time = "4:00 PM"
    @wedding_location = "123 Wedding St, Ciudad"

    if @guest
      render :show
    else
      redirect_to root_path
    end
  end

  def rsvp
    # Fetch the guest using the token passed in the URL
    @guest = Guest.find_by(token: params[:id]) # 'id' comes from the token in the URL

    # If the guest is found, update the RSVP status
    if @guest
      @guest.update(rsvp: true)
      return redirect_to root_path # Redirect to home after updating the RSVP
    else
      redirect_to root_path, alert: "Invitación no encontrada."
      return # Ensure the action stops here
    end
  end



  def index
    @guests = Guest.all
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      redirect_to guests_path
    else
      render :new
    end
  end

  def edit
    # Render edit view
  end

  def update
    if @guest.update(guest_params)
      redirect_to guests_path
    else
      render :edit
    end
  end

  def destroy
    @guest.destroy
    redirect_to guests_path
  end

  private

  def set_guest
    @guest = Guest.find_by(token: params[:token]) || Guest.find_by(id: params[:id])
  end

  def guest_params
    params.require(:guest).permit(:name, :email)
  end

  def check_admin_role
    unless current_admin&.role.in?(%w[bride groom planner])
      redirect_to root_path, alert: 'You are not authorized to access this page.'
    end
  end
end
