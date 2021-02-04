require "rails_helper"

RSpec.feature :show_tweet do

	before do
		@tweet = create(:tweet)
	end

	scenario "A user navigates to tweet from tweets page" do
		visit "/"
		click_link @tweet.content
		expect(page).to have_content(@tweet.content)
		expect(page.current_path).to eq("/tweets/#{@tweet.id}")
	end
end
