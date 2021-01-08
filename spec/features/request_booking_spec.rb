feature "Request" do
  scenario "" do
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
end
