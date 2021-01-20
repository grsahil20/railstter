require "rails_helper"

RSpec.feature :signin_user do

	scenario "A user with valid credentials logs in" do
		user = create(:user)
		visit "/users/sign_in"

		password = Faker::Internet.password(min_length: 8)
		fill_in "user_login", with: user.email
		fill_in "user_password", with: "password"
		click_button "Sign In"

		expect(page).to have_content(Users::RegistrationsController::SIGNIN_SUCCESSFUL)
		expect(page.current_path).to eq('/')
	end

	# scenario "A user fails to signin with invalid credentials" do
	# 	User.destroy_all

	# 	visit "/users/sign_up"
	# 	password = Faker::Internet.password(min_length: 8)
	# 	fill_in "user_email", with: ""
	# 	fill_in "user_username", with: Faker::Internet.username(separators: %w())
	# 	fill_in "user_full_name", with: Faker::Name.name
	# 	fill_in "user_password", with: password
	# 	fill_in "user_password_confirmation", with: password
	# 	click_button "Sign Up"

	# 	expect(page).to have_content("Please review the problems below:")
	# 	expect(page.current_path).to eq('/users')
	# 	expect(User.count).to eq(0)
	# end

end
