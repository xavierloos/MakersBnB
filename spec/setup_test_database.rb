require "pg"
p "Setting up test database..."

def setup_test_database
  p "Setting up test database..."
  conn = PG.connect(dbname: 'abodenb_test')
  conn.exec("TRUNCATE listings, users, dates, bookable_dates, bookings restart IDENTITY")
end
