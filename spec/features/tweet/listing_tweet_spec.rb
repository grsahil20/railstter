require "rails_helper"

RSpec.feature :listing_tweets do

	scenario "List existing tweets" do
		tweets = create_list(:tweet, 2)

		visit "/"

		tweets.each do |tweet|
			expect(page).to have_content(tweet.content)
			expect(page).to have_link(tweet.content)
		end
	end

	scenario "No existing tweets" do
		visit "/"
		expect(page).to have_content('No Tweets')
	end

	scenario "List existing tweets for a user" do
		visit "/"
		expect(page).to have_content('No Tweets')
	end
end
