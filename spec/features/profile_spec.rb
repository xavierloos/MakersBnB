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

  scenario "allows user to make a request" do
    login
    add_listing1
    fill_in("available_night", with: "01/01/2021")
    click_button("Add date")
    click_button("Finish")
    visit "/profile/:id"
    click_button("Log out")
    other_login
    visit "/listings"
    click_link("testtitle")
    first(".booking_item").click_button "Request to book"
    # expect(page.current_path).to eq "/profile"
    expect(page).to have_content "Welcome"
    expect(page).to have_content "testtitle"
    expect(page).to have_content "Request pending"
  end

  scenario "shows the requests I have received" do
    login
    add_listing1
    fill_in("available_night", with: "01/01/2021")
    click_button("Add date")
    click_button("Finish")
    visit "/profile/:id"
    click_button("Log out")
    other_login
    visit "/listings"
    click_link("testtitle")
    first(".booking_item").click_button "Request to book"
    login
    expect(page).to have_content "Welcome"
    expect(page).to have_content "testtitle"
    expect(page).to have_content "test_username"
    expect(page).to have_content "2021-01-01"
  end
end
