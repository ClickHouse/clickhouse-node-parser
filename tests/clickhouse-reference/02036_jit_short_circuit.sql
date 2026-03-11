SELECT if(action = 'bonus', sport_amount, 0) * 100 FROM (SELECT message AS action, cast(message, 'Float64') AS sport_amount FROM test_table);
