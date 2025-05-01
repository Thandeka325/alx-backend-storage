-- This script creates a table 'users' with id, email, and name.
-- The 'id' is an auto-incremented integer and the primary key.
-- The 'email' is a unique, non-null VARCHAR(255)
-- The 'name' is a VARCHAR(255)
-- If the the table already exists, the script is set to not fail.


-- Create table:
CREATE TABLE IF NOT EXISTS users (
	-- id: auto-incremented primary key
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

	-- email: unique and not null
	email VARCHAR(255) NOT NULL UNIQUE,

	-- name: optional string
	name VARCHAR(255)
);
