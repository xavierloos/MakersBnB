require 'pg'
require_relative './db_test_connection_helper.rb'

class Listing

  attr_reader :id, :title, :description, :price, :available_night

  def initialize(id:, title:, description:, price:, available_night:)
    @id = id
    @title = title
    @description = description
    @price = price
    @available_night = available_night
  end

  def self.create(title:, description:, price:, available_night:)
    conn = connect_to_database
    result_listings = conn.exec("INSERT INTO listings (title, description, price) VALUES ('#{title}', '#{description}', '#{price}') RETURNING id, title, description, price;")
    result_available_nights = conn.exec("INSERT INTO available_nights (listing_id, date) VALUES ('#{result_listings[0]['id']}', '#{available_night}') RETURNING date;")
    Listing.new(id: result_listings[0]['id'], title: result_listings[0]['title'], description: result_listings[0]['description'], price: result_listings[0]['price'].to_i, available_night: result_available_nights[0]['date'])
  end

  def self.all
    conn = connect_to_database
    result = conn.exec("SELECT * FROM listings JOIN available_nights ON listings.id=available_nights.listing_id")
    result.map { |listing| Listing.new(id: listing['listing_id'], title: listing['title'], description: listing['description'], price: listing['price'].to_i, available_night: listing['date']) }
  end

  def self.find(id:)
    conn = connect_to_database
    result = conn.exec("SELECT * FROM listings JOIN available_nights ON listings.id=available_nights.listing_id WHERE listings.id = '#{id}';")
    Listing.new(title: result[0]['title'], description: result[0]['description'], price: result[0]['price'], id: result[0]['id'], available_night: result[0]['date'])
  end

end
