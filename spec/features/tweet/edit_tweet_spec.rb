require "rails_helper"

RSpec.feature :edit_tweet do

	before do
		@tweet = create(:tweet)
	end

	scenario "A user update a existing tweet with valid details" do
		@tweet = create(:tweet)
		new_content = Faker::Lorem.sentence
		visit "/"
		find("#tweets_table #tweet_#{@tweet.id} #edit").click
		fill_in "tweet_content", with: new_content
		click_button "Update Tweet"
		expect(page).to have_content(TweetsController::RECORD_UPDATED)
		expect(page).to have_content(new_content)
		expect(page.current_path).to eq("/tweets/#{ @tweet.id }")
	end

	scenario "A user update a existing tweet with valid details" do
		@tweet = create(:tweet)
		visit "/"
		find("#tweets_table #tweet_#{@tweet.id} #edit").click
		fill_in "tweet_content", with: ''
		click_button "Update Tweet"
		expect(page).to have_content(TweetsController::RECORD_NOT_UPDATED)
		expect(page.current_path).to eq("/tweets/#{ @tweet.id }")
	end

end