require "rails_helper"

RSpec.feature :listing_tweets do

	scenario "List existing tweeta" do
		tweets = create_list(:tweet, 2)

		visit "/"

		tweets.each do |tweet|
			expect(page).to have_content(tweet.content)
		end
	end
end