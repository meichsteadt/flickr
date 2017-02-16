class ImagesController < ApplicationController
  protect_from_forgery with: :exception
  def index
    @images = Image.all
  end
end
