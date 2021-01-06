CREATE TABLE available_nights (id SERIAL PRIMARY KEY, date DATE, listing_id INTEGER REFERENCES listings (id));
