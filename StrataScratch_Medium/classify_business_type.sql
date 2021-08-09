-- Classify each business as either a restaurant, cafe, school, or other. A restaurant should have 
-- the word 'restaurant' in the business name. For cafes, either 'cafe' or 'coffee' can be in the 
-- business name. 'School' should be in the business name for schools. All other businesses should 
-- be classified as 'other'.

Notes
- use case when and ilike (case insensitive) statements to classify the business types

SELECT DISTINCT business_name, 
    CASE 
        WHEN business_name ILIKE '%restaurant%' THEN 'restaurant'
        WHEN business_name ILIKE '%cafe%' 
            OR business_name ILIKE '%coffee%' THEN 'cafe'
        WHEN business_name ILIKE '%school%' THEN 'school'
        END AS business_type
FROM sf_restaurant_health_violations;