require 'listing.rb'

describe Listing do

  describe 'self.create' do
    it 'adds a listing to the database' do
      conn = PG.connect(dbname: 'abodenb_test')
      Listing.create(title: 'testtitle', description: 'test description', price: '100')
      result = conn.exec("SELECT * FROM listings;")
      expect(result[0]['title']).to eq 'testtitle'
      expect(result[0]['description']).to eq 'test description'
      expect(result[0]['price']).to eq '100'
    end
    #
    # it 'adds available nights to the available_nights database' do
    #   conn = PG.connect(dbname: 'abodenb_test')
    #   Listing.create(title: 'testtitle', description: 'test description', price: '100')
    #   result = conn.exec("SELECT * FROM available_nights;")
    #   expect(result[0]['date']).to eq '2021-01-01'
    # end

  end

  describe 'self.all' do
    it 'returns an array of listing objects of all listings in the database' do
      conn = PG.connect(dbname: 'abodenb_test')
      Listing.create(title: 'testtitle', description: 'test description', price: '100')
      Listing.create(title: 'testtitle2', description: 'test description', price: '100')
      expect(Listing.all.first).to be_kind_of(Listing)
      expect(Listing.all.last).to be_kind_of(Listing)
      expect(Listing.all.length).to eq 2
      expect(Listing.all.first.title).to eq 'testtitle'
      expect(Listing.all.last.title).to eq 'testtitle2'
    end
  end

  describe '#title' do
    it 'returns the title of the listing' do
      pg_instance_returned = Listing.create(title: 'testtitle', description: 'test description', price: '100')
      expect(pg_instance_returned.title).to eq 'testtitle'
    end
  end

  describe '#price' do
    it 'returns the price of the listing' do
      pg_instance_returned = Listing.create(title: 'testtitle', description: 'test description', price: '100')
      expect(pg_instance_returned.price).to eq 100
    end
  end

end
