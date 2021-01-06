require 'pg'
require_relative './db_test_connection_helper.rb'

class Listing

  attr_reader :id, :title, :description, :price

  def initialize(id:, title:, description:, price:)
    @id = id
    @title = title
    @description = description
    @price = price
  end

  def self.create(title:, description:, price:)
    conn = connect_to_database
    result = conn.exec("INSERT INTO listings (title, description, price) VALUES ('#{title}', '#{description}', '#{price}') RETURNING id, title, description, price;")
    Listing.new(id: result[0]['id'], title: result[0]['title'], description: result[0]['description'], price: result[0]['price'].to_i)
  end

  def self.all
    conn = connect_to_database
    result = conn.exec("SELECT * FROM listings")
    result.map { |listing| Listing.new(id: listing['id'], title: listing['title'], description: listing['description'], price: listing['price'].to_i) }
  end

end
