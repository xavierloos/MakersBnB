
CREATE TABLE listings(id SERIAL PRIMARY KEY, title VARCHAR(60));
-- Adding extra colums
ALTER TABLE listings ADD description VARCHAR(280);
ALTER TABLE listings ADD price INTEGER;