require "rails_helper"

RSpec.feature :create_tweet do

	scenario "A user creates a new tweet" do
		visit "/"
		click_link "New Tweet"
		fill_in "Title", with: "Creating a tweet"
		click_button "Create Tweet"
		expect(page).to have_content("tweet has been created")
		expect(page.current_path).to eq(articles_path)
		expect(page.current_path).to eq(articles_path)
	end

end