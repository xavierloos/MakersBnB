require 'listing.rb'

describe Listing do
  
  describe 'self.create' do
    it 'adds a listing to the database' do
      conn = PG.connect(dbname: 'abodenb_test')
      Listing.create('testtitle')
      result = conn.exec("SELECT title FROM listings;")
      expect(result[0]['title']).to eq 'testtitle'
    end
  end

  describe 'self.all' do
    it 'returns an array of all listings in the database' do
      conn = PG.connect(dbname: 'abodenb_test')
      conn.exec("INSERT INTO listings (title) VALUES ('testtitle');")
      expect(Listing.all).to eq ['testtitle']
    end
  end

  describe '#title' do
    it 'returns the title of the listing' do
      pg_instance_returned = Listing.create('testtitle')
      expect(pg_instance_returned.title).to eq 'testtitle'
    end
  end

end
