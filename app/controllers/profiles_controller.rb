class ProfilesController < ApplicationController
  before_action :authenticate_admin! # Ensure admin is logged in
  before_action :set_admin, only: [:show, :edit, :update] # Set @admin for these actions

  def show
    @admin = current_admin
  end

  def edit
  end

  def update
    if @admin.update(admin_params)
      redirect_to profile_path, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  # Set the admin for profile actions
  def set_admin
    @admin = current_admin
  end

  # Strong parameters for updating admin profile
  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end
end
