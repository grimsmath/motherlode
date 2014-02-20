class ImagesController < ApplicationController
  def show
    nugget = Nugget.where('images._id' => BSON::ObjectId.from_string(params[:id])).first
    image = nugget.images.where(_id: params[:id]).first

    content = image.content
    send_data content.data, type: 'image/png', disposition: 'inline' # Detect correct mime type
  end
end
