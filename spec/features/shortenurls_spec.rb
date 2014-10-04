require 'rails_helper'

feature "Shortenurls", :type => :feature do
  background do
	Url.create(longurl:"aa", shorturl:"bb")
  end
  scenario "with valid long url user could shorten url" do
  	visit root_path
  	expect {
  	    fill_in 'longurlvalue', :with=>'baidu.com'
  	    click_button 'shortenurl'
  	}.to change(Url,:count).by(1)
  	
  end

  scenario "with valid long url user could shorten url", js: true do
    visit root_path
  	fill_in 'longurlvalue', :with=>'baidu.com'
  	click_button 'shortenurl'
  	
  	expect(page).to have_content 'Short Url:'
  end

  scenario "with blank long url user couldn't shorten url", js: true  do
  	visit root_path
  	expect{
  		fill_in 'longurlvalue', with:''
  		click_button 'shortenurl'
  	}.not_to change(Url, :count)
  	expect(page).to have_content 'Url can not be blank'
  end


end
