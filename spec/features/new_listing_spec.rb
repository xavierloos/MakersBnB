feature "new listing" do
  scenario "adding a new listing that is then visible" do
    login
    add_listing1
    click_button("Finish")
    expect(page).to have_content "testtitle"
    expect(page).to have_content "test description"
    expect(page).to have_content "100"
    expect(page).not_to have_content "sinatra"
  end

  scenario "can add multiple listings" do
    login
    add_listing1
    click_button("Finish")
    add_listing2
    click_button("Finish")
    expect(page).to have_content "testtitle"
    expect(page).to have_content "testtitle2"
    expect(page).not_to have_content "sinatra"
  end

  scenario "can add available dates" do
    login
    add_listing1
    fill_in("available_night", with: "01/01/2021")
    click_button("Add date")
    click_button("Finish")
    click_link("testtitle")
    expect(page).to have_content "testtitle"
    expect(page).to have_content "01/01/2021"
    expect(page).not_to have_content "sinatra"
  end
end
