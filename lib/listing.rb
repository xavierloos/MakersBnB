require 'pg'

class Listing

  def self.create(title)
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'abodenb_test')
    else
      conn = PG.connect(dbname: 'abodenb')
    end
      result = conn.exec("INSERT INTO listings (title) VALUES ('#{title}') RETURNING title;")
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'abodenb_test')
    else
      conn = PG.connect(dbname: 'abodenb')
    end
    result = conn.exec("SELECT title FROM listings")
    result.map { |listing| listing['title'] }
  end

end