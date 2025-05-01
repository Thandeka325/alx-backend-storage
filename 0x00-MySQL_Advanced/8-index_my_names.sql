-- This script creates an index idx_name_first_score on the table names and the first letter of name and the score.

-- Create index on the first letter of the name column

CREATE INDEX idx_name_first ON names (name(1));
