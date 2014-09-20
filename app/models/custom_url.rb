class CustomUrl < ActiveRecord::Base
	include Processurl
	validates :longurl, :shorturl, presence:true
	

	
end
