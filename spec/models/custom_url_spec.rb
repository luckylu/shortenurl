require 'rails_helper'

RSpec.describe CustomUrl, :type => :model do

  describe "create CustomUrl" do
  	before :each do
  		@validurl = CustomUrl.new(longurl:"http://baidu.com", shorturl:"aa", baseid:"aa".base62_decode)
  		@longurlblank = CustomUrl.new(longurl:"", shorturl:"bb", baseid:"bb".base62_decode)
  		@shorturlblank = CustomUrl.new(longurl:"baidu.com", shorturl:"")
  		@urlblank = CustomUrl.new(longurl:"", shorturl:"")
  	end
  	context "when user input valid url" do
  		it "should create custom url" do
  			expect {@validurl.save}.to change{CustomUrl.count}.by(1)
  		end
  	end

  	context "when user does not input longurl" do
  		it "should not create custom url" do
  			expect {@longurlblank.save}.not_to change {CustomUrl.count}
  		end
  	end

  	context "when user does not input shorturl" do
  		it "should not create custom url" do
  			expect {@shorturlblank.save}.not_to change {CustomUrl.count}
  		end
  	end

  	context "when user does not input both" do
  		it "should not create custom url" do
  			expect {@urlblank}.not_to change {CustomUrl.count}
  		end
  	end

  
  end

  describe "when user input special char in custom url" do
  	it "should not create custom url" do
  		expect {CustomUrl.create(longurl:"baidu.com", shorturl:"><,.", baseid:"><,.".base62_decode)}.to raise_error
  	end
  end

end
