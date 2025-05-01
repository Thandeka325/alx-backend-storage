-- This scripts creates a stored procedure ComputeAverageScoreForUser that computes and store the average score for a student.
-- An average score can be a decimal

-- Create stored procedure ComputeAverageScoreForUser

Delimiter $$

CREATE PROCEDURE ComputeAverageScoreForUser (
	IN user_id INT
)
BEGIN
	DECLARE avg_score FLOAT;

	-- Compute average score from corrections for the user
	SELECT AVG(score) INTO avg_score
	FROM corrections
	WHERE corrections.user_id = user_id;

	-- Update the user's average_score
	UPDATE users
	SET average_score = avg_score
	WHERE id = user_id;
END$$

DELIMITER ;
