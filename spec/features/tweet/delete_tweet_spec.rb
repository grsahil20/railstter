require "rails_helper"

RSpec.feature :delete_tweet do

	before do
		@tweet = create(:tweet)
	end

	scenario "A user deletes an existing tweet from index page" do
		new_content = Faker::Lorem.sentence
		visit "/"
		find("#tweets_table #tweet_#{@tweet.id} #destroy").click
		expect(page).to have_content(TweetsController::RECORD_DELETED)
		expect(page.current_path).to eq("/tweets")
	end

	scenario "A user deletes an existing tweet from show page" do
		new_content = Faker::Lorem.sentence
		visit "/tweets/#{@tweet.id}"
		find("tweet #destroy").click
		expect(page).to have_content(TweetsController::RECORD_DELETED)
		expect(page.current_path).to eq("/tweets")
	end
end