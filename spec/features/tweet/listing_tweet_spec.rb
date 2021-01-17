require "rails_helper"

RSpec.feature :listing_tweets do

	scenario "List existing tweeta" do
		tweet1 = Tweet.create(content: Faker::Lorem.sentence)
		tweet2 = Tweet.create(content: Faker::Lorem.sentence)

		visit "/"
		expect(page).to have_content(tweet1.content)
		expect(page).to have_content(tweet2.content)
	end
end