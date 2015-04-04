class MainPhotoController < ApplicationController
  def create
    @mainphoto = MainPhoto.new(image: params["Filedata"])
    @mainphoto.save!
    render json: { :img => @mainphoto.image.url, :photo_id => @mainphoto.id }
  end
end
