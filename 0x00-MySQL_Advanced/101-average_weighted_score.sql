-- This script creates a stored procedure ComputeAverageWeightedScoreForUsers that computes and store the average weighted score for all students.

-- Create stored procedure ComputeAverageWeightedScoreForUsers

DELIMITER //

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers //

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
	DECLARE done INT DEFAULT 0;
	DECLARE uid INT;
	DECLARE total_weight INT;
	DECLARE weighted_sum FLOAT;

	-- Cursor to loop through user IDs
	DECLARE user_cursor CURSOR FOR SELECT id FROM users;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

	OPEN user_cursor;

	user_loop: LOOP
		FETCH user_cursor INTO uid;
		IF done THEN
			LEAVE user_loop;
		END IF;

		-- Calculate weighted sum and total weight for the current user
		SELECT
			SUM(p.weight),
			SUM(c.score * p.weight)
		INTO
			total_weight,
			weighted_sum
		FROM corrections c
		JOIN projects p ON c.project_id = p.id
		WHERE c.user_id = uid;

		-- Update the user's average_score
		UPDATE users
		SET average_score = IF(total_weight = 0, 0, weighted_sum / total_weight)
		WHERE id = uid;

	END LOOP;

	CLOSE user_cursor;
END //

DELIMITER ;
