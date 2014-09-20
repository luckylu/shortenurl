class Url < ActiveRecord::Base
    include Processurl
	validates :longurl, presence:true
	


end
