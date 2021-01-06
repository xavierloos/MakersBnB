feature "Login" do
  scenario "User can login" do
    visit "/login"
    User.create(username: "test_user", email: "test@test.com", password: "test")
    fill_in "email", with: "test@test.com"
    fill_in "password", with: "test"
    click_button "Enter"
    expect(page).to have_content "Welcome"
  end

  scenario "a non-user cannot login" do
    visit "/login"
    User.create(username: "test_user", email: "test@test.com", password: "test")
    fill_in "email", with: "wrong@test.com"
    fill_in "password", with: "test"
    click_button "Enter"
    expect(page.current_path).to eq "/login"
    expect(page).to have_content "Please check your email or password"
  end

  scenario "a user with an incorrect password cannot login" do
    visit "/login"
    User.create(username: "test_user", email: "test@test.com", password: "test")
    fill_in "email", with: "test@test.com"
    fill_in "password", with: "wrong"
    click_button "Enter"
    expect(page).to have_content "Please check your email or password"
  end
end
