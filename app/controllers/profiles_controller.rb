class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  def show
  end

  private
    def profile_params
      params.require(:profiles).permit(:name)
    end
    def set_profile
      @profile = Profile.find(params[:id])
    end
end
