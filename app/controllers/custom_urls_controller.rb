class CustomUrlsController < ApplicationController
	def new
		@customurl = CustomUrl.new
	end

	def create
        @customurl = CustomUrl.new(custom_url)
        if (params[:custom_url][:shorturl].match(/[^[:alnum:]]/))
        	@illegal_char = true
        else
		  @baseid = params[:custom_url][:shorturl].base62_decode
		  @illegal_char = false
		end
	    
	    respond_to do |format|
	      if (Url.exists?(@baseid) || CustomUrl.exists?(baseid:@baseid))
		    format.html { render nothing: true}
		    format.js {render "customurl_taken.js"}
		  elsif (@illegal_char)
		  	format.html { render nothing: true}
		  	format.js {render "illegal_char.js"}
		  else
            @customurl.baseid = @baseid
		  	@customurl.save
            format.html { render nothing: true}
            format.js
          
          end

        end
	end

	

	private 
	def custom_url
	  params.require(:custom_url).permit(:longurl,:shorturl)
    end
end
