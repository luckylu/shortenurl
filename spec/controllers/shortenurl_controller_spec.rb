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

end
