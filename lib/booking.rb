require 'pg'

class Booking

  attr_reader :id, :date_id, :listing_id, :user_id
  attr_writer :status

  def initialize(id:, date_id:, listing_id:, user_id:)
    @id = id
    @date_id = date_id
    @listing_id = listing_id
    @user_id = user_id
    @status = 'pending'
  end

  def self.create(date_id:, listing_id:, user_id:)
    conn = connect_to_database
    booking_entry = conn.exec("INSERT INTO bookings (date_id, listing_id, user_id, status) VALUES ('#{date_id}', '#{listing_id}', '#{user_id}', 'pending') RETURNING id, date_id, listing_id, user_id")
    conn.close
    Booking.new(id: booking_entry[0]['id'], date_id: booking_entry[0]['date_id'], listing_id: booking_entry[0]['listing_id'], user_id: booking_entry[0]['user_id'])
  end

  def self.find_my_bookings(id:)
    conn = connect_to_database
    result = conn.exec("SELECT * FROM bookings WHERE user_id = '#{id}';")
    conn.close
    result.map do |booking|
      Booking.new(id: booking["id"], date_id: booking["date_id"], listing_id: booking["listing_id"], user_id: booking["user_id"])
    end
  end

  def find_date
    conn = connect_to_database
    result = conn.exec("SELECT * FROM dates WHERE id = '#{self.id}';")
    conn.close
    result[0]['date']
  end

end
