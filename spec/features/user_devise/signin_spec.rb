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

      expect(page).to have_content("Signed in successfully")
      expect(page).to have_content(@user.full_name)
      expect(page).to have_content(@user.email)
      expect(page).to have_content(@user.username)
      expect(page.current_path).to eq("/")
    end
    scenario "with username" do
      fill_in "user_login", with: @user.username
      fill_in "user_password", with: "password"
      click_button "Sign In"

      expect(page).to have_content("Signed in successfully")
      expect(page).to have_content(@user.full_name)
      expect(page).to have_content(@user.email)
      expect(page).to have_content(@user.username)
      expect(page.current_path).to eq("/")
    end
    scenario "with devise helper" do
      sign_in(@user)
      visit("/")

      expect(page).to have_content(@user.full_name)
      expect(page).to have_content(@user.email)
      expect(page).to have_content(@user.username)
    end
  end

  context "A user with invalid credentials not able to logs in" do
    scenario "with email" do
      fill_in "user_login", with: @user.email
      fill_in "user_password", with: "invalid_password"
      click_button "Sign In"

      expect(page).to have_content("Invalid Login or password")
      expect(page.current_path).to eq("/users/sign_in")
    end
    scenario "with username" do
      fill_in "user_login", with: @user.username
      fill_in "user_password", with: "invalid_password"
      click_button "Sign In"

      expect(page).to have_content("Invalid Login or password")
      expect(page.current_path).to eq("/users/sign_in")
    end
  end
end
