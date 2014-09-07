class Url < ActiveRecord::Base

	validates :longurl, presence:true
	before_save :remove_http_from_longurl

	def remove_http_from_longurl
		if (self.longurl.index("http://"))
		  md = /(http:\/\/)(.*)/.match(self.longurl)
		  self.longurl = md[2]
		elsif (self.longurl.index("https://"))
		  md = /(https:\/\/)(.*)/.match(self.longurl)
		  self.longurl = md[2]
		end
	end
end
