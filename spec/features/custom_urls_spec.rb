require 'rails_helper'

feature "CustomUrls", :type => :feature do
  background do
  	CustomUrl.create(longurl:"google.com", shorturl:"google", baseid:"google".base62_decode)
  	Url.create(longurl:"weibo.com", shorturl:"weibo", id:"weibo".base62_decode)
  end
  scenario "with valid short url and long url" do
  	visit root_path
  	click_link "Custom"
  	expect {
  		fill_in "customlongurl", :with => "baidu.com"
  		fill_in "customshorturl", :with => "baidu"
  		click_button "customurlbutton"
  	}.to change(CustomUrl, :count).by(1)
  	
  end
  scenario "with blank long url and valid short url" do
  	visit root_path
  	click_link "Custom"
  	expect {
  		fill_in "customlongurl", :with => " "
  		fill_in "customshorturl", :with => "baidu"
  		click_button "customurlbutton"
  	}.not_to change(CustomUrl, :count)
  end

  scenario "with blank long url and blank short url" do
  	visit root_path
  	click_link "Custom"
  	expect {
  		fill_in "customlongurl", :with => " "
  		fill_in "customshorturl", :with => ""
  		click_button "customurlbutton"
  	}.not_to change(CustomUrl, :count)
  end

  scenario "with valid long url and blank short url" do
  	visit root_path
  	click_link "Custom"
  	expect {
  		fill_in "customlongurl", :with => "baidu.com"
  		fill_in "customshorturl", :with => " "
  		click_button "customurlbutton"
  	}.not_to change(CustomUrl, :count)
  end

  scenario "when short url has been taken in CustomUrl" do
  	visit root_path
  	click_link "Custom"
  	expect {
  		fill_in "customlongurl", :with => "google.com"
  		fill_in "customshorturl", :with => "google"
  		click_button "customurlbutton"
  	}.not_to change(CustomUrl, :count)
  end

  scenario "when short url has been taken in Url" do
  	visit root_path
  	click_link "Custom"
  	expect {
  		fill_in "customlongurl", :with => "weibo.com"
  		fill_in "customshorturl", :with => "weibo"
  		click_button "customurlbutton"
  	}.not_to change(CustomUrl, :count)
  end

  scenario "when short url has special character" do
  	visit root_path
  	click_link "Custom"
  	expect {
  		fill_in "customlongurl", :with => 'weibo.com'
  		fill_in "customshorturl", :with => 'weibo#{}'
  		click_button "customurlbutton"
  	}.not_to change(CustomUrl, :count)
  end

  scenario "when long url is blank", js: true do
  	visit root_path
  	click_link "Custom"
  	fill_in "customlongurl", with:""
  	fill_in "customshorturl", with:""
  	click_button "customurlbutton"
  	expect(page).to have_content 'Origin Url can not be blank'
  end

  scenario "when short url is blank", js: true do
  	visit root_path
  	click_link "Custom"
  	fill_in "customlongurl", with:"aa"
  	fill_in "customshorturl", with:""
  	click_button "customurlbutton"
  	expect(page).to have_content 'Custom Url can not be blank'
  end

  scenario "when long url and short url are blank", js: true do
  	visit root_path
  	click_link "Custom"
  	fill_in "customlongurl", with:""
  	fill_in "customshorturl", with:""
  	click_button "customurlbutton"
  	expect(page).to have_content 'Origin Url can not be blank'
  	click_button "OK"
  	fill_in "customlongurl", with:"aa"
  	click_button "customurlbutton"
  	expect(page).to have_content 'Custom Url can not be blank'
  	click_button "OK"
  	fill_in "customshorturl", with:"ccd"
  	click_button "customurlbutton"
  	expect(page).to have_content "/ccd"
  end
end
