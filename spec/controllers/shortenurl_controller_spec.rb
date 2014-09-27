require 'rails_helper'

RSpec.describe ShortenurlController, :type => :controller do
	describe "Get#index" do
		it "renders the index template" do
			get :index
			expect(response).to render_template("index")
			
		end

		it "response successfully with an HTTP 200 status code" do
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end
	end

	describe "Post#create" do
		before :each do
			Url.create(longurl:"aa", shorturl:"bb")
		end
		it "create short url and save in the database" do
			expect {
				post :create,
				url: attributes_for(:url)
			}.to change(Url, :count)
		end
	end

end
