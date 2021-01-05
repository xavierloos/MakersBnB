feature "Login" do
  scenario "User can login" do
    visit "/login"
    User.create(username: "test_user", email: "test@test.com", password: "test")
    fill_in "email", with: "test@test.com"
    fill_in "password", with: "test"
    click_button "Enter"
    expect(page).to have_content "Welcome"
  end
end
