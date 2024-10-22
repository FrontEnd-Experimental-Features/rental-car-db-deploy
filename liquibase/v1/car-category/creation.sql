-- Create the CarType table (if not already created)
CREATE TABLE IF NOT EXISTS CarType (
    id SERIAL PRIMARY KEY,
    type VARCHAR(50) NOT NULL UNIQUE,
    title VARCHAR(50),
    is_active BOOLEAN DEFAULT true
);

-- Create the CarCategory table (with is_active)
CREATE TABLE IF NOT EXISTS CarCategory (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    type_id INTEGER REFERENCES CarType(id),
    is_active BOOLEAN DEFAULT true
);
