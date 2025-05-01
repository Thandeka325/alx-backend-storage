-- This script ranks country origins of bands, ordered by the number of (non-unique) fans.
-- Output columns must be: origin and nb_fans.
-- Order results by the number of fans in descending order.

-- Select origin and sum of fans grouped by origin
SELECT
	origin,
	SUM(fans) AS nb_fans
FROM
	metal_bands
GROUP BY
	origin
ORDER BY
	nb_fans DESC;
