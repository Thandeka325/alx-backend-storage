-- This script creates table 'users' with id, email, name, and country.
-- The 'id' is an auto-incremented integer and the primary key.
-- The 'email' is a unique, non-null VARCHAR(255).
-- The 'name' is a VARCHAR(255).
-- The 'country' is an ENUM of 'US', 'CO', 'TN', not null, default 'US'
-- Script is set not to fail if table already exists.

-- Create table if it does not exists:
CREATE TABLE IF NOT EXISTS users (
	-- id: auto-incremented primary key
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

	-- email: unique and not null
	email VARCHAR(255) NOT NULL UNIQUE,

	-- name: optional string
	name VARCHAR(255),

	-- country: ENUM with default value 'US'
	country ENUM('US', 'CO', 'TN') NOT NULL DEFAULT 'US'
);
