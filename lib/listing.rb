require 'pg'
require 'db_test_connection_helper.rb'

class Listing

  attr_reader :id, :title

  def initialize(id:, title:)
    @id = id
    @title = title
  end

  def self.create(title)
    conn = connect_to_database
    result = conn.exec("INSERT INTO listings (title) VALUES ('#{title}') RETURNING id, title;")
    Listing.new(id: result[0]['id'], title: result[0]['title'])
  end

  def self.all
    conn = connect_to_database
    result = conn.exec("SELECT title FROM listings")
    result.map { |listing| listing['title'] }
  end

end
