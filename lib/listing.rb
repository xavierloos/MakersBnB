require 'pg'
require 'db_test_connection_helper.rb'

class Listing

  def self.create(title)
    conn = connect_to_database
    result = conn.exec("INSERT INTO listings (title) VALUES ('#{title}') RETURNING title;")
  end

  def self.all
    conn = connect_to_database
    result = conn.exec("SELECT title FROM listings")
    result.map { |listing| listing['title'] }
  end

end
