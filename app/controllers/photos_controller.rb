class PhotosController < ApplicationController
  def create
    @photo = Photo.new(image: params["Filedata"])
    @photo.save!
    render :text=> "![](#{@photo.image.url})"
  end
end
