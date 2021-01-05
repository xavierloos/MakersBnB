feature "new listing" do
  scenario "adding a new listing that is then visible" do
    add_listing1
    expect(page).to have_content 'testtitle'
    expect(page).not_to have_content 'sinatra'
  end
  scenario "can add multiple listings" do
    add_listing1
    add_listing2
    expect(page).to have_content 'testtitle'
    expect(page).to have_content 'testtitle2'
    expect(page).not_to have_content 'sinatra'
  end
end
