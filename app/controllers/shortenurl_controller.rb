class ShortenurlController < ApplicationController
 
  def index
  	@url = Url.new
  end

  def new
  	@url = Url.new
  end

  def create
  	@surl = Url.new(params_url)
  	id = Url.all.size+1
  	@surl.shorturl = id.base62_encode
  	respond_to do |format|
  	  if @surl.save
  	  	format.html {redirect_to root_path}
  	  	format.js{}
  	  end
  	end
  end

  def decodeurl
  	id = params[:id].base62_decode
  	@url = Url.find(id)
    redirect_to("http://#{@url.longurl}")
  end

  private
    def params_url
    	params.require(:url).permit(:longurl)
    end
end
