# feature "/listings" do
#   it "allows each listing to be booked" do
#     login
#     visit('/listings/new')
#     add_listing1
#     add_listing2
#     fill_in("available_night", with: "01/01/2021")
#     click_button("Add date")
#     click_button("Finish")
#     within("//li[@id='1']") do
#       click_button('Request to book')
#     end
#     expect(page).to have_content('Available dates:')
#   end
# end
