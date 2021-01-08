require 'booking'

describe Booking do
  describe '.create' do
    it 'creates a new booking' do
      booking = Booking.create(date_id: 4, listing_id: 3, user_id: 2)
      expect(booking).to be_kind_of Booking
      expect(booking.date_id).to eq '4'
      expect(booking.listing_id).to eq '3'
      expect(booking.user_id).to eq '2'
    end
  end

  describe '.find_my_bookings' do
    it 'returns an array of requests I have made' do
      # user = User.create(username: "test_user", email: "test@test.com", password: "test_password")
      # listing = Listing.create(title: 'testtitle', description: 'test description', price: '100')
      booking = Booking.create(date_id: 4, listing_id: 3, user_id: 2)
      booking_data = Booking.find_my_bookings(id: 2)
      expect(booking_data.first.id).to eq booking.id
    end
  end
end
