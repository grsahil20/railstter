require "rails_helper"

RSpec.feature :create_tweet do

	scenario "A user creates a new tweet" do
		content = Faker::Lorem.sentence
		visit "/"
		click_link "New Tweet"
		fill_in "tweet_content", with: content
		click_button "Create Tweet"
		expect(page).to have_content("Tweet has been created")
		expect(page).to have_content(content)
		expect(page.current_path).to eq('/tweets')
	end

	scenario "A user fails to create a new tweet" do
		visit "/"
		click_link "New Tweet"
		fill_in "tweet_content", with: ""
		click_button "Create Tweet"
		# expect(page).to have_content("Tweet has been created")
		expect(page).to have_content("Content can't be blank")
	end

end