feature "Signup page" do
  scenario "has a signup form" do
    visit "/signup"
    expect(page).to have_content "Sign up"
  end
  scenario "can create a new user" do
    visit "/signup"
    fill_in "username", with: "test"
    fill_in "email", with: "test@test.com"
    fill_in "password", with: "test"
    click_button "Register"
    expect(page).to have_content "Welcome"
  end
end
