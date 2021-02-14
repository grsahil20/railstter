require "rails_helper"

RSpec.feature :edit_tweet do

	before do
		@users = create_list(:user, 2)
		@user = @users[0]
		@other_user = @users[1]
		@tweet = create(:tweet, user: @user)
	end

	context "when user is author of tweet" do
		before do
  		sign_in(@user)
		end
		scenario "A user update a existing tweet with valid details from index page" do
			new_content = Faker::Lorem.sentence
			visit "/users/#{@user.id}/tweets"
			find("#tweets_table #tweet_#{@tweet.id} #edit").click
			fill_in "tweet_content", with: new_content
			click_button "Update Tweet"
			expect(page).to have_content('Tweet has been updated')
			expect(page).to have_content(new_content)
			expect(page.current_path).to eq("/tweets/#{ @tweet.id }")
		end

		scenario "A user update a existing tweet with valid details from show page" do
			new_content = Faker::Lorem.sentence

			visit "/users/#{@user.id}/tweets"
			find("#tweets_table #tweet_#{@tweet.id} #show").click

			find(".tweet #edit").click
			fill_in "tweet_content", with: new_content
			click_button "Update Tweet"

			expect(page).to have_content('Tweet has been updated')
			expect(page).to have_content(new_content)
			expect(page.current_path).to eq("/tweets/#{ @tweet.id }")
		end

		scenario "A user tries to update a existing tweet with non valid details" do
			visit "/users/#{@user.id}/tweets"
			find("#tweets_table #tweet_#{@tweet.id} #edit").click
			fill_in "tweet_content", with: ''
			click_button "Update Tweet"
			expect(page).to have_content('Tweet can not been updated')
			expect(page.current_path).to eq("/users/#{ @user.id }/tweets/#{ @tweet.id }")
		end
	end

	context "when user is not author of tweet" do
		before do
  		sign_in(@other_user)
		end

		scenario "restrict acccess to edit page" do
			visit "/users/#{@user.id}/tweets/#{@tweet.id}/edit"
			expect(page).to have_content('Unauthorized access')
			expect(page.current_path).to eq("/")
		end
		scenario "tweet not found for brute force edit page" do
			visit "/users/#{@other_user.id}/tweets/#{@tweet.id}/edit"
			expect(page).to have_content('Tweet not found')
			expect(page.current_path).to eq("/")
		end
	end

end
