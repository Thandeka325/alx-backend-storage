-- This script creates a function SafeDiv that divides (and returns) the first by the second number or returns 0 if the second number is equal to 0.

-- Create function safeDiv to safely divide two integers.

DROP FUNCTION IF EXISTS safeDiv;

DELIMITER //

CREATE FUNCTION safeDiv(a INT, b INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
	If b = 0 THEN
		RETURN 0;
	ELSE
		RETURN a / b;
	END IF;
END;
//

DELIMITER ;
