-- This script creates a trigger that decreases the quantity of an item after adding a new order.
-- The trigger executes AFTER INSERT on the 'orders' table.
-- It update the 'items' table by subtracting the order number from the corresponding item's quantity.

-- Drop the trigger if it already exists to avoid errors
DROP TRIGGER IF EXISTS decrease_item_quantity;

-- Create the trigger
DELIMITER $$

CREATE TRIGGER decrease_item_quantity
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
	UPDATE items
	SET quantity = quantity - NEW.number
	WHERE name = NEW.item_name;
END$$

DELIMITER ;
