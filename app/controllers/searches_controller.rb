class SearchesController < ApplicationController
  def index
    # if params[:search]
    # @photos = flicker search photos
    FlickRaw.api_key = ENV['FLICKRAW_API_KEY']
    FlickRaw.shared_secret = ENV['FLICKRAW_SHARED_SECRET']
    # save the id if something found 
    # accepted_params[:flickr_user]
    @photos = flickr.people.getPublicPhotos(user_id: '191363317@N04', extras: 'url_m')
  end


  private

  def accepted_params
    params.require(:search).permit(:flickr_user)
  end
end
