FactoryGirl.define do 
	factory :url do
		longurl:"baidu.com"
		
	end
	factory :custom_url do
		longurl:"baidu.com"
		shorturl:"baidu"
	end

end
