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
end
