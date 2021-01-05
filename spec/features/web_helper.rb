def add_listing1
  visit('/listings/new')
  fill_in('title', with: 'testtitle')
  click_button('Submit')
end

def add_listing2
  visit('/listings/new')
  fill_in('title', with: 'testtitle2')
  click_button('Submit')
end
