-- Create the states table
CREATE TABLE States (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    is_active BOOLEAN DEFAULT true
);

-- Create the cities table
CREATE TABLE Cities (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    state_id INTEGER NOT NULL,
    is_active BOOLEAN DEFAULT true,
    FOREIGN KEY (state_id) REFERENCES States(id)
);

-- Create a unique constraint on city name and state_id
CREATE UNIQUE INDEX idx_unique_city_per_state ON Cities(name, state_id);