require 'rails_helper'

RSpec.describe Url, :type => :model do
  describe "input origin url" do
    it "should add one record" do
  	    @url = Url.new(longurl:"http://baidu.com")
  	    @url.shorturl = (Url.all.size+1).base62_encode
  	    expect {@url.save}.to change{Url.count}.by(1)
    end
  end

  describe "do not input origin url" do
  	it "should not add record" do
  		@url = Url.new(longurl:"")
  		@url.shorturl = (Url.all.size+1).base62_encode
  		expect {@url.save}.not_to change{Url.count}
  	end
  end

end
