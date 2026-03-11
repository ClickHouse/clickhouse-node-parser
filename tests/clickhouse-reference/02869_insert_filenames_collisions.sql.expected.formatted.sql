SELECT lower(hex(reverse(CAST(sipHash128('very_very_long_column_name_that_will_be_replaced_with_hash'), 'FixedString(16)'))));

SELECT *
FROM t_collisions
ORDER BY e798545eefc8b7a1c2c81ff00c064ad8 ASC;