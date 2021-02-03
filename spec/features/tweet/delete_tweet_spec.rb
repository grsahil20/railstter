require "rails_helper"

RSpec.feature :delete_tweet do

	before do
		@tweet = create(:tweet)
	end

	context "A user deletes an existing tweet" do
		scenario "from index page" do
			visit "/"
			find("#tweets_table #tweet_#{@tweet.id} #destroy").click
			expect(page).to have_content('Tweet has been deleted')
			expect(page.current_path).to eq("/tweets")
		end

		scenario "from show page" do
			visit "/tweets/#{@tweet.id}"
			find("tweet #destroy").click
			expect(page).to have_content('Tweet has been deleted')
			expect(page.current_path).to eq("/tweets")
		end
	end
end
