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

  describe "test instance method remove_http_from_longurl" do
    before :each do
    	@httpurl = Url.new(longurl:"http://baidu.com",shorturl:(Url.all.size+1).base62_encode)
    	@httpsurl = Url.new(longurl:"https://baidu.com",shorturl:(Url.all.size.+1).base62_encode)
    end
    context "remove http" do
        it "http should be removed" do
      	  expect(@httpurl.remove_http_from_longurl).to eq 'baidu.com'
        end
    end

    context "remove https" do
    	it "https should be removed" do
    		expect(@httpsurl.remove_http_from_longurl).to eq 'baidu.com'
    	end
    end
  end

  describe "when user input http or https" do
  	before :each do
    	@httpurl = Url.create(longurl:"http://baidu.com",shorturl:(Url.all.size+1).base62_encode)
    	@httpsurl = Url.create(longurl:"https://baidu.com",shorturl:(Url.all.size.+1).base62_encode)
    end
  	context "when user input http" do
  		it "http should be removed" do
  			expect(@httpurl.longurl).to eq 'baidu.com'
  		end
  	end
  	context "when user input https" do
  		it "https should be removed" do
  			expect(@httpsurl.longurl).to eq 'baidu.com'
  		end
  	end
  end

  describe "test factory girl" do
    
    it "should aa" do
    	expect(build(:url)).to be_valid
    end
  end


end
