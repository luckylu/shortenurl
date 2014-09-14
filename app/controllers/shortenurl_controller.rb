class ShortenurlController < ApplicationController
 
  def index
  	@url = Url.new
  end

  def create
  	@surl = Url.new(params_url)
  	@id = Url.all.size+1
    verify_id(@id)
  	@surl.shorturl = @new_id.base62_encode
  	respond_to do |format|
  	  if @surl.save
  	  	format.html {redirect_to root_path}
  	  	format.js{}
  	  end
  	end
  end

  def decodeurl

  	id = params[:id].base62_decode
    if (Url.exists?(id))
  	  @url = Url.find(id)
      redirect_to("http://#{@url.longurl}")
    elsif (CustomUrl.exists?(baseid:id))
      @url = CustomUrl.find_by(baseid:id)
      redirect_to("http://#{@url.longurl}")
    else
      redirect_to root_path
    end
    
  end

  private
    def params_url
    	params.require(:url).permit(:longurl)
    end

    def verify_id(id)
      @vid = id
      if (CustomUrl.exists?(baseid:@vid))
        @url = Url.new
        @url.longurl = CustomUrl.find_by(baseid:@vid).longurl
        @url.shorturl = @vid.base62_encode
        @url.save
        verify_id(@vid+1)
      else
        return @new_id = @vid
      end
    end

end
