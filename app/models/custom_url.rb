class CustomUrl < ActiveRecord::Base
	validates :longurl, :shorturl, presence:true
end
