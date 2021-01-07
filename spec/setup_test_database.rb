require "pg"
p "Setting up test database..."

def setup_test_database
  conn = PG.connect(dbname: "abodenb_test")
  conn.exec("TRUNCATE listings, users")
end
