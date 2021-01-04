feature "Home page" do
  scenario "have a welcome" do
    visit "/"
    expect(page).to have_content "Welcome"
  end
end
