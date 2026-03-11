SELECT number, dictGet('01759_db.test_dictionary', 'value1', tuple(number)) as value1,
   dictGet('01759_db.test_dictionary', 'value2', tuple(number)) as value2 FROM system.numbers LIMIT 3;
