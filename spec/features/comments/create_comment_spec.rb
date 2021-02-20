require "rails_helper"

RSpec.feature :create_comment do

	before(:each) do
		@tweet = create(:tweet)
		@other_user = create(:user)
		sign_in(@other_user)
	end

	scenario "A user comments on a tweet" do
		content = Faker::Lorem.sentence
		visit "/tweets/#{ @tweet.id }"
		fill_in "comment_content", with: content
		click_button "Create Comment"
		expect(page).to have_content('Comment has been created')
		expect(page).to have_content(content)
		expect(page.current_path).to eq("/tweets/#{ @tweet.id }")
	end

	scenario "A user fails to comment on a new tweet" do
		visit "/tweets/#{ @tweet.id }"
		fill_in "comment_content", with: ""
		click_button "Create Comment"
		expect(page).to have_content('Comment can not been created')
		expect(page).to have_content("Content can't be blank")
	end

end
