class SearchesController < ApplicationController
  def index
    @search = Search.new
    @num_searches = Search.count
    @last_search = Search.where(valid_request: true).last
    @photos = []
    @photos = session[:tmp_photos] if session[:tmp_photos]
    # @photos = flicker search photos
    
    # save the id if something found 
    # accepted_params[:flickr_user]
    session[:tmp_photos] = []
  end

  def create
    @photos = request_photos
    if @photos.any?
      @search = Search.create(flickr_user: accepted_params[:flickr_user], valid_request: true)
      flash[:notice] = 'Photos found'
    else
      @search = Search.create(flickr_user: accepted_params[:flickr_user], valid_request: false)
      flash[:notice] = 'No photos'
    end
    session[:tmp_photos] = @photos
    redirect_to searches_url
  end

      #   '191363317@N04'

  private
  
  def request_photos
    FlickRaw.api_key = ENV['FLICKRAW_API_KEY']
    FlickRaw.shared_secret = ENV['FLICKRAW_SHARED_SECRET']
    flickr.people.getPublicPhotos(user_id: accepted_params[:flickr_user], extras: 'url_m')
  rescue FlickRaw::FailedResponse
    []
  end

  def accepted_params
    params.require(:search).permit(:flickr_user)
  end
end
