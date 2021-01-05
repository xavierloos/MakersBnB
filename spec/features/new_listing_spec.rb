feature "new listing" do
  scenario "adding a new listing that is then visible" do
    visit('/listings/new')
    fill_in('title', with: 'testtitle')
    click_button('Submit')
    expect(page).to have_content 'testtitle'
    expect(page).not_to have_content 'sinatra'
  end
end