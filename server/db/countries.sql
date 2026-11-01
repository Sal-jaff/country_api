DROP TABLE IF EXISTS geo;
DROP TABLE IF EXISTS city;
DROP TABLE IF EXISTS country;


CREATE TABLE country(
    country_id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    capital VARCHAR(100) NOT NULL,
    population INT NOT NULL,
    languages VARCHAR(100) NOT NULL,
    fun_fact VARCHAR(250),
    map_image_url VARCHAR(255),
    PRIMARY KEY (country_id)

);

INSERT INTO country(name,capital,population,languages,fun_fact,map_image_url)
VALUES 
('Brazil', 'Brasília', 212559417, 'Portuguese', 'Brazil is the fifth largest country in the world by both land area and population.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/1200px-Flag_of_Brazil.svg.png'),
  ('Mexico', 'Mexico City', 127575529, 'Spanish', 'Mexico is home to the world''s largest pyramid, the Great Pyramid of Cholula.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Flag_of_Mexico.svg/1200px-Flag_of_Mexico.svg.png'),
  ('United States', 'Washington, D.C.', 329064917, 'English', 'The United States has the largest economy in the world.', 'https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1200px-Flag_of_the_United_States.svg.png'),
  ('India', 'New Delhi', 1353000000, 'Hindi, English', 'India is the world''s largest democracy.', 'https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png'),
  ('China', 'Beijing', 1409517397, 'Mandarin', 'China has the world''s largest population.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_the_People%27s_Republic_of_China.svg/1200px-Flag_of_the_People%27s_Republic_of_China.svg.png'),
  ('Russia', 'Moscow', 145934462, 'Russian', 'Russia is the largest country in the world by land area.', 'https://upload.wikimedia.org/wikipedia/en/thumb/f/f3/Flag_of_Russia.svg/1200px-Flag_of_Russia.svg.png'),
  ('Japan', 'Tokyo', 126860301, 'Japanese', 'Japan is home to the world''s largest fish market, Tsukiji Market.', 'https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/Flag_of_Japan.svg/1200px-Flag_of_Japan.svg.png'),
  ('South Africa', 'Pretoria', 57779622, 'Afrikaans, English, Zulu, Xhosa, and others', 'South Africa has 11 official languages.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Flag_of_South_Africa.svg/1200px-Flag_of_South_Africa.svg.png'),
  ('Australia', 'Canberra', 24982688, 'English', 'Australia is the only country that is also a continent.', 'https://upload.wikimedia.org/wikipedia/en/thumb/8/88/Flag_of_Australia.svg/1200px-Flag_of_Australia.svg.png');

CREATE TABLE city(
    city_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    city_name VARCHAR(100) NOT NULL,
    city_population INT,
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    country_id INT NOT NULL,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

INSERT INTO city (city_name, city_population, latitude, longitude, country_id)
VALUES
('São Paulo', 11451999, -23.550520, -46.633308, 1),
('Rio de Janeiro', 6211423, -22.906847, -43.172897, 1),
('Mexico City', 9209944, 19.432608, -99.133209, 2),
('Guadalajara', 1385629, 20.659699, -103.349609, 2),
('New York City', 8804190, 40.712776, -74.005974, 3),
('Los Angeles', 3898747, 34.052235, -118.243683, 3),
('Mumbai', 12442373, 19.076090, 72.877426, 4),
('New Delhi', 16787941, 28.613939, 77.209023, 4),
('Shanghai', 24874500, 31.230391, 121.473701, 5),
('Beijing', 21893095, 39.904202, 116.407394, 5),
('Moscow', 13104177, 55.755826, 37.617300, 6),
('Saint Petersburg', 5601911, 59.931100, 30.360900, 6),
('Tokyo', 14000000, 35.676200, 139.650300, 7),
('Osaka', 2753862, 34.693725, 135.502254, 7),
('Johannesburg', 5635127, -26.204103, 28.047305, 8),
('Cape Town', 4618000, -33.924870, 18.424055, 8),
('Sydney', 5312163, -33.868820, 151.209296, 9),
('Melbourne', 5078193, -37.813629, 144.963058, 9);