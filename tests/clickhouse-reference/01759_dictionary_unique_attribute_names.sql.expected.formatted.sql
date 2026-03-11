SELECT
    number,
    dictGet('01759_db.test_dictionary', 'value1', tuple(number)) AS value1,
    dictGet('01759_db.test_dictionary', 'value2', tuple(number)) AS value2
FROM `system`.numbers
LIMIT 3;