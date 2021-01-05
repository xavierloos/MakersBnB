def connect_to_database
  if ENV['RACK_ENV'] == 'test'
    PG.connect(dbname: 'abodenb_test')
  else
    PG.connect(dbname: 'abodenb')
  end
end
