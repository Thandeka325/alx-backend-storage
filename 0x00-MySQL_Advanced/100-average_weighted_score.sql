-- This script creates a stored procedure ComputeAverageWeightedScoreForUser that computes and store the average weighted score for a student.

-- Create stored procedure ComputeAverageWeightedScoreForUser

DELIMITER //

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser //

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
	DECLARE total_weight INT DEFAULT 0;
	DECLARE weighted_sum FLOAT DEFAULT 0;

	-- Compute the total weight and weighted sum of scores
	SELECT
		SUM(p.weight),
		SUM(c.score * p.weight)
	INTO
		total_weight,
		weighted_sum
	FROM corrections c
	JOIN projects p ON c.project_id = p.id
	WHERE c.user_id = user_id;

	-- Update the user's average_score
	UPDATE users
	SET average_score = IF(total_weight = 0, 0, weighted_sum / total_weight)
	WHERE id = user_id;
END //

DELIMITER ;
