feature "/listings" do
  it "allows each listing to be booked" do
    visit('/listings/new')
    add_listing1
    add_listing2
    within("//li[@id='1']") do
      click_button('Request to book')
    end
    expect(page).to have_content('Available dates:')
  end
end
