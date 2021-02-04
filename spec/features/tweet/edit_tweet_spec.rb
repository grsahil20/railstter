require "rails_helper"

RSpec.feature :edit_tweet do

	before do
		@user = create(:user)
		@tweet = create(:tweet, user: @user)
  	sign_in(@user)
	end

	scenario "A user update a existing tweet with valid details from index page" do
		new_content = Faker::Lorem.sentence
		visit "/users/#{@user.id}/tweets"
		find("#tweets_table #tweet_#{@tweet.id} #edit").click
		fill_in "tweet_content", with: new_content
		click_button "Update Tweet"
		expect(page).to have_content('Tweet has been updated')
		expect(page).to have_content(new_content)
		expect(page.current_path).to eq("/tweets/#{ @tweet.id }")
	end

	scenario "A user update a existing tweet with valid details from show page" do
		new_content = Faker::Lorem.sentence

		visit "/users/#{@user.id}/tweets"
		find("#tweets_table #tweet_#{@tweet.id} #show").click

		find(".tweet #edit").click
		fill_in "tweet_content", with: new_content
		click_button "Update Tweet"

		expect(page).to have_content('Tweet has been updated')
		expect(page).to have_content(new_content)
		expect(page.current_path).to eq("/tweets/#{ @tweet.id }")
	end

	scenario "A user tries to update a existing tweet with non valid details" do
		visit "/users/#{@user.id}/tweets"
		find("#tweets_table #tweet_#{@tweet.id} #edit").click
		fill_in "tweet_content", with: ''
		click_button "Update Tweet"
		expect(page).to have_content('Tweet can not been updated')
		expect(page.current_path).to eq("/users/#{ @user.id }/tweets/#{ @tweet.id }")
	end

end
