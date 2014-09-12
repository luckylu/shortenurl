class CustomUrlsController < ApplicationController
	def new
		@customurl = CustomUrl.new
	end

	def create
        @customurl = CustomUrl.new(custom_url)
		@baseid = params[:custom_url][:shorturl].base62_decode
		if (Url.exists?(@baseid) || CustomUrl.exists?(baseid:@baseid))
			redirect_to new_custom_url_path
		else
	      @customurl.baseid = @baseid
          @customurl.save
        end
	end







	private 
	def custom_url
	  params.require(:custom_url).permit(:longurl,:shorturl)
    end
end
