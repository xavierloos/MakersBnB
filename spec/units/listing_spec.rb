require 'listing.rb'

describe Listing do

  describe 'self.create' do
    it 'adds a listing to the database' do
      conn = PG.connect(dbname: 'abodenb_test')
      Listing.create(user_id: '1', title: 'testtitle', description: 'test description', price: '100')
      result = conn.exec("SELECT * FROM listings;")
      expect(result[0]['title']).to eq 'testtitle'
      expect(result[0]['description']).to eq 'test description'
      expect(result[0]['price']).to eq '100'
    end
  end

  describe '#add_availability' do
    it 'adds available nights to the bookable_dates database' do
      conn = PG.connect(dbname: 'abodenb_test')
      listing = Listing.create(user_id: '1', title: 'testtitle', description: 'test description', price: '100')
      listing.add_availability(date: '01-01-2021')
      result1 = conn.exec("SELECT * FROM dates;")
      result2 = conn.exec("SELECT * FROM bookable_dates")
      expect(result1[0]['id']).to eq result2[0]['date_id']
      expect(result1[0]['date']).to eq '2021-01-01'
      expect(listing.available_nights).to include '2021-01-01'
    end
  end

  describe '#available_nights' do
    it 'returns an array of a listings available nights' do
      conn = PG.connect(dbname: 'abodenb_test')
      listing = Listing.create(user_id: '1', title: 'testtitle', description: 'test description', price: '100')
      listing.add_availability(date: '01-01-2021')
      expect(listing.available_nights).to eq ['2021-01-01']
    end
  end

  describe 'self.all' do
    it 'returns an array of listing objects of all listings in the database' do
      conn = PG.connect(dbname: 'abodenb_test')
      Listing.create(user_id: '1', title: 'testtitle', description: 'test description', price: '100')
      Listing.create(user_id: '1', title: 'testtitle2', description: 'test description', price: '100')
      expect(Listing.all.first).to be_kind_of(Listing)
      expect(Listing.all.last).to be_kind_of(Listing)
      expect(Listing.all.length).to eq 2
      expect(Listing.all.first.title).to eq 'testtitle'
      expect(Listing.all.last.title).to eq 'testtitle2'
    end
  end

  describe '#title' do
    it 'returns the title of the listing' do
      pg_instance_returned = Listing.create(user_id: '1', title: 'testtitle', description: 'test description', price: '100')
      expect(pg_instance_returned.title).to eq 'testtitle'
    end
  end

  describe '#price' do
    it 'returns the price of the listing' do
      pg_instance_returned = Listing.create(user_id: '1', title: 'testtitle', description: 'test description', price: '100')
      expect(pg_instance_returned.price).to eq 100
    end
  end

end
