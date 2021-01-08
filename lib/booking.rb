require 'pg'

class Booking

  attr_reader :date_id, :listing_id, :user_id
  attr_writer :status

  def initialize( date_id:, listing_id:, user_id:)
    @date_id = date_id
    @listing_id = listing_id
    @user_id = user_id
    @status = 'pending'
  end

  def self.create(date_id:, listing_id:, user_id:)
    conn = connect_to_database
    booking_entry = conn.exec("INSERT INTO bookings (date_id, listing_id, user_id, status) VALUES ('#{date_id}', '#{listing_id}', '#{user_id}', 'pending') RETURNING date_id, listing_id, user_id")
    conn.close
    Booking.new(date_id: booking_entry[0]['date_id'], listing_id: booking_entry[0]['listing_id'], user_id: booking_entry[0]['user_id'])
  end

end
