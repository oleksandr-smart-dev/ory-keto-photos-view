class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_photo, only: [:show]

  def show
    unless can_view_photo?(@photo)
      flash[:error] = "You don't have permission to view this photo."
      redirect_to root_path
    end
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def can_view_photo?(photo)
    if photo.user_id == current_user.id
      return true
    else
      return current_user.has_permission?(photo.id)
    end
  end
end
