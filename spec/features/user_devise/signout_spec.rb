require "rails_helper"

RSpec.feature :signout_user do
  context "A signed in user" do
    scenario "signouts successfully" do
      user = create(:user)

      sign_in(user)
      visit "/"
      click_link "Sign Out"

      expect(page).to have_content("Signed out successfully.")
      expect(page).not_to have_content("Sign out")
      expect(page.current_path).to eq("/")
    end
  end
end
