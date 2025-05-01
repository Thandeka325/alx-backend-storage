-- This script lists all bands with 'Glam rock' as their main style, ranked by their longevity.
-- Output columns: band_name and lifespan (in years until 2022)
-- Lifespan is calculated from 'formed' to 'split' (or 2022 if not split)
-- Results are ordered by lifespan in descending order

-- Select band names and computed lifespans for Glam rock bands
SELECT
	band_name,
	IFNULL(split, 2022) - formed AS lifespan
FROM
	metal_bands
WHERE
	FIND_IN_SET('Glam rock', IFNULL(style, "")) > 0
ORDER BY
	lifespan DESC;
