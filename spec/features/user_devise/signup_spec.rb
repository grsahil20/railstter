require "rails_helper"

RSpec.feature :signup_user do

	scenario "A user creates a new tweet" do
		User.destroy_all

		visit "/users/sign_up"
		password = Faker::Internet.password(min_length: 8)
		fill_in "user_email", with: Faker::Internet.email
		fill_in "user_username", with: Faker::Internet.username(separators: %w())
		fill_in "user_full_name", with: Faker::Name.name
		fill_in "user_password", with: password
		fill_in "user_password_confirmation", with: password
		click_button "Sign Up"

		expect(page).to have_content(Users::RegistrationsController::SIGNUP_SUCCESSFUL)
		expect(page.current_path).to eq('/')
		expect(User.count).to eq(1)
	end

	# scenario "A user fails to create a new tweet" do
	# 	visit "/"
	# 	click_link "New Tweet"
	# 	fill_in "tweet_content", with: ""
	# 	click_button "Create Tweet"
	# 	expect(page).to have_content(TweetsController::RECORD_NOT_CREATED)
	# 	expect(page).to have_content("Content can't be blank")
	# end

end