require "rails_helper"

RSpec.feature :create_tweet do


	scenario "A user creates a new tweet" do
		visit "/"
		click_link "New Tweet"
		fill_in "tweet_content", with: "Test text for tweet"
		click_button "Create Tweet"
		expect(page).to have_content("Tweet has been created")
		expect(page).to have_content("Test text for tweet")
		expect(page.current_path).to eq('/tweets')
	end

end