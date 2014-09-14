class CustomUrlsController < ApplicationController
	def new
		@customurl = CustomUrl.new
	end

	def create
        @customurl = CustomUrl.new(custom_url)
		@baseid = params[:custom_url][:shorturl].base62_decode
		respond_to do |format|
		  if (Url.exists?(@baseid) || CustomUrl.exists?(baseid:@baseid))
			format.html {redirect_to root_path}
			format.js {render "customurl_taken.js"}
		  else
	        @customurl.baseid = @baseid
            @customurl.save
            format.html
            format.js
          end
        end
	end

	

	private 
	def custom_url
	  params.require(:custom_url).permit(:longurl,:shorturl)
    end
end
