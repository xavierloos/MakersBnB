feature "new listing" do

  scenario "adding a new listing that is then visible" do
    add_listing1
    expect(page).to have_content 'testtitle'
    expect(page).to have_content 'test description'
    expect(page).to have_content '100'
    expect(page).not_to have_content 'sinatra'
  end

  scenario "can add multiple listings" do
    add_listing1
    add_listing2
    expect(page).to have_content 'testtitle'
    expect(page).to have_content 'testtitle2'
    expect(page).not_to have_content 'sinatra'
  end

  scenario "can add available dates" do
    visit('/listings/new')
    fill_in('title', with: 'testtitle')
    fill_in('description', with: 'test description')
    fill_in('price', with: '100')
    select '01', from: 'day'
    select 'January', from: 'month'
    select '2021', from: 'year'
    click_button('Submit')
    click_link('testtitle')
    expect(page).to have_content '01/01/2021'
    expect(page).not_to have_content 'sinatra'
  end

end
