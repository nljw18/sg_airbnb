-- Select relevant columns & give it meaningful names.
       
SELECT DISTINCT listing.name AS property_description,  -- Unique listings
                host.id AS id,                         
                host.host_name AS owner,  
                listing.listing_type,   
                listing.date,                 
                listing.price, 
                listing.no_of_reviews,
                location.neighbourhood,
                location.latitude,
                location.longitude

-- Join data from different table 
FROM apac_airbnb.host AS host

INNER JOIN apac_airbnb.listing AS listing

ON apac_airbnb.host.host_id = apac_airbnb.listing.host_id

INNER JOIN apac_airbnb.location AS location

ON apac_airbnb.host.host_id = apac_airbnb.location.host_id


WHERE location.country = "Singapore"  -- Singapore's Listing

AND location.region = "Central"  -- Focus on central of Singapore 

AND YEAR(listing.date) = 2023 -- From Year 2023

AND listing.no_of_reviews > 10; -- With more than 10 reviews

