def add_listing1
  visit('/listings/new')
  fill_in('title', with: 'testtitle')
  fill_in('description', with: 'test description')
  fill_in('price', with: '100')
  select '01', from: 'day'
  select 'January', from: 'month'
  select '2021', from: 'year'
  click_button('Submit')
end

def add_listing2
  visit('/listings/new')
  fill_in('title', with: 'testtitle2')
  fill_in('description', with: 'test description2')
  fill_in('price', with: '200')
  select '01', from: 'day'
  select 'January', from: 'month'
  select '2021', from: 'year'
  click_button('Submit')
end
