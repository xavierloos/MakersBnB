feature "Profile" do
  scenario "a non-user cannot access to profile from typing the url" do
    visit "/profile/:id"
    expect(page).to have_content "Login"
  end

  scenario "user can log out" do
    login
    click_button "Log out"
    expect(page).to have_content "Login"
  end
end
