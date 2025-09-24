CREATE TABLE cities (
  id INT AUTO_INCREMENT PRIMARY KEY,
  country_code VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE countries (
  code VARCHAR(255) UNIQUE NOT NULL,
  description VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE customers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  postal_code VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  country_code VARCHAR(255) NOT NULL,
  phone VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE reservations (
  id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  trip_id INT NOT NULL,
  reservation_date DATE NOT NULL,
  number_of_adults INT NOT NULL,
  number_of_children INT NOT NULL,
  paid INT DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE trips (
  id INT AUTO_INCREMENT PRIMARY KEY,
  city_id INT NOT NULL,
  number_of_days INT NOT NULL,
  departure_date DATE NOT NULL,
  price INT NOT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE cities
  ADD CONSTRAINT cities_country_code_foreign FOREIGN KEY (country_code) REFERENCES countries (code);

ALTER TABLE customers
  ADD CONSTRAINT customers_country_code_foreign FOREIGN KEY (country_code) REFERENCES countries (code);

ALTER TABLE reservations
  ADD CONSTRAINT reservations_customer_id_foreign FOREIGN KEY (customer_id) REFERENCES customers (id),
  ADD CONSTRAINT reservations_trip_id_foreign FOREIGN KEY (trip_id) REFERENCES trips (id);

ALTER TABLE trips
  ADD CONSTRAINT trips_city_id_foreign FOREIGN KEY (city_id) REFERENCES cities (id);