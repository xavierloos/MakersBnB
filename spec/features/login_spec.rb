feature "Login" do
  scenario "User can login" do
    login
    expect(page).to have_content "Welcome test_user"
  end

  scenario "a non-user cannot login" do
    wrong_email_login
    expect(page.current_path).to eq "/login"
    expect(page).to have_content "Please check your email or password"
  end

  scenario "a user with an incorrect password cannot login" do
    wrong_password_login
    expect(page).to have_content "Please check your email or password"
  end
end
