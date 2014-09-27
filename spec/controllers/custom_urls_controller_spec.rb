require 'rails_helper'

RSpec.describe CustomUrlsController, :type => :controller do
	describe "Post#create" do
		context "with vaild params" do
			it "save in the database" do
				expect {
					post :create,
					custom_url: attributes_for(:custom_url)
				}.to change(CustomUrl, :count)
			end
		end

		context "with special char in shoturl" do
			it "does not save in the database" do
				expect {
					post :create,
					custom_url: attributes_for(:custom_url, shorturl:"aa+")
				}.not_to change(CustomUrl, :count)
			end
		end

		context "with blank longurl" do
			it "does not save in the database" do
				expect {
					post :create,
					custom_url: attributes_for(:custom_url, longurl:"")
				}.not_to change(CustomUrl, :count)
			end
		end

		context "with blank shorturl" do
			it "does not save in the database" do
				expect {
					post :create,
					custom_url: attributes_for(:custom_url, shorturl:"")
				}.not_to change(CustomUrl, :count)
			end
		end

		context "with blank longurl and shorturl" do
			it "does not save in the database" do
				expect {
					post :create,
					custom_url: attributes_for(:custom_url, longurl:"", shorturl:"")
				}.not_to change(CustomUrl, :count)
			end
		end

	end



end
