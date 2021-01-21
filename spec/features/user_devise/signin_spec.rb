require "rails_helper"

RSpec.feature :signin_user do
  before do
    @user = create(:user)
      visit "/users/sign_in"
  end

  context "A user with valid credentials succesfully logs in" do
    scenario "with email" do
      fill_in "user_login", with: @user.email
      fill_in "user_password", with: "password"
      click_button "Sign In"

      expect(page).to have_content(Users::SessionsController::SIGNIN_SUCCESSFUL)
      expect(page.current_path).to eq("/")
    end
    scenario "with username" do
      fill_in "user_login", with: @user.username
      fill_in "user_password", with: "password"
      click_button "Sign In"

      expect(page).to have_content(Users::SessionsController::SIGNIN_SUCCESSFUL)
      expect(page.current_path).to eq("/")
    end
	end

  context "A user with invalid credentials not able to logs in" do
    scenario "with email" do
      fill_in "user_login", with: @user.email
      fill_in "user_password", with: "invalid_password"
      click_button "Sign In"

      expect(page).to have_content(Users::SessionsController::SIGNIN_FAILED)
      expect(page.current_path).to eq("/users/sign_in")
    end
    scenario "with username" do
      fill_in "user_login", with: @user.username
      fill_in "user_password", with: "invalid_password"
      click_button "Sign In"

      expect(page).to have_content(Users::SessionsController::SIGNIN_FAILED)
      expect(page.current_path).to eq("/users/sign_in")
    end
  end
end
