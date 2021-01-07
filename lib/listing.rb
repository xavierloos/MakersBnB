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
    result_listings = conn.exec("INSERT INTO listings (title, description, price) VALUES ('#{title}', '#{description}', '#{price}') RETURNING id, title, description, price;")
    Listing.new(id: result_listings[0]['id'], title: result_listings[0]['title'], description: result_listings[0]['description'], price: result_listings[0]['price'].to_i)
  end

  def self.all
    conn = connect_to_database
    result = conn.exec("SELECT * FROM listings")
    result.map { |listing| Listing.new(id: listing['id'], title: listing['title'], description: listing['description'], price: listing['price'].to_i)}
  end

  def self.find(id:)
    conn = connect_to_database
    result = conn.exec("SELECT * FROM listings WHERE listings.id = '#{id}';")
    Listing.new(title: result[0]['title'], description: result[0]['description'], price: result[0]['price'], id: result[0]['id'])
  end

  def available_nights
    conn = connect_to_database
    nights = conn.exec("SELECT * FROM dates JOIN bookable_dates ON dates.id = bookable_dates.date_id WHERE bookable_dates.listing_id = '#{self.id}'")
    nights.map { |night| night['date'] }
  end

  def add_availability(date:)
    add_date(date) unless date_exists?(date)
    conn = connect_to_database
    result = conn.exec("SELECT id FROM dates WHERE date = '#{Date.parse(date).strftime("%Y%m%d").to_i}'")
    conn.exec("INSERT INTO bookable_dates (listing_id, date_id) VALUES ('#{self.id}', '#{result[0]['id']}')")
  end

  private

  def add_date(date)
    conn = connect_to_database
    result = conn.exec("INSERT INTO dates (date) VALUES ('#{Date.parse(date).strftime("%Y%m%d").to_i}')")
  end

  def date_exists?(date)
    conn = connect_to_database
    check = conn.exec("SELECT * FROM dates WHERE date = '#{Date.parse(date).strftime("%Y%m%d").to_i}';")
    check.any?
  end

end
