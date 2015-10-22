class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  def show
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render :edit
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:name)
    end

    def set_profile
      @profile = Profile.find(params[:id])
    end
end
