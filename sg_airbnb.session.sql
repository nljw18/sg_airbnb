-- Select relevant columns give it meaningful names.
        -- Ensure no duplicate property listing
SELECT  DISTINCT listing.name AS property_description,
        host.host_name AS owner,  
        listing.room_type AS listing_type,
        listing.price AS price_per_day_sgd,
        listing.minimum_days AS minimum_days_of_stay, 
        -- calculate  minimum_price_of_stay
        (listing.price * listing.minimum_days) AS minimum_price_of_stay,
        listing.number_of_reviews,
        location.neighbourhood,
        location.latitude,
        location.longitude

-- Join data from different table 
FROM sg_airbnb.host AS host

INNER JOIN sg_airbnb.listing AS listing

ON sg_airbnb.host.host_id = sg_airbnb.listing.host_id

INNER JOIN sg_airbnb.location AS location

ON sg_airbnb.host.host_id = sg_airbnb.location.host_id

-- Only listing from central of Singapore
WHERE location.neighbourhood_group = "Central"  

-- Must have more than 10 reviews
AND listing.number_of_reviews>10 

-- Order by minimum_price_of_stay from highest to lowest
ORDER BY minimum_price_of_stay DESC ;