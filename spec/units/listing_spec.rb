require 'listing.rb'

describe Listing do
  
  describe 'self.create' do
    it 'adds a listing to the database' do
      pg_instance_returned = Listing.create('testtitle')
      expect(pg_instance_returned[0]['title']).to eq 'testtitle'
    end
  end

  describe 'self.all' do
    it 'returns an array of all listings in the database' do
      conn = PG.connect(dbname: 'abodenb_test')
      conn.exec("INSERT INTO listings (title) VALUES ('testtitle');")
      expect(Listing.all).to eq ['testtitle']
    end
  end

end
