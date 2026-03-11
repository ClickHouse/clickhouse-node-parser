SELECT like(CAST('hello' AS FixedString(5)), 'hello');

SELECT like(CAST('hello' AS FixedString(5)), 'world');

SELECT like(CAST('hello' AS FixedString(5)), 'xyz');

SELECT like(CAST('hello' AS FixedString(5)), 'hell');

SELECT like(CAST('hello' AS FixedString(5)), 'orld');

SELECT like(CAST('hello' AS FixedString(5)), '%hello%');

SELECT like(CAST('hello' AS FixedString(5)), '%world%');

SELECT like(CAST('hello' AS FixedString(5)), '%xyz%');

SELECT like(CAST('hello' AS FixedString(5)), '%hell%');

SELECT like(CAST('hello' AS FixedString(5)), '%orld%');

SELECT like(CAST('hello' AS FixedString(5)), '%hello');

SELECT like(CAST('hello' AS FixedString(5)), '%world');

SELECT like(CAST('hello' AS FixedString(5)), '%xyz');

SELECT like(CAST('hello' AS FixedString(5)), '%hell');

SELECT like(CAST('hello' AS FixedString(5)), '%orld');

SELECT like(CAST('hello' AS FixedString(5)), 'hello%');

SELECT like(CAST('hello' AS FixedString(5)), 'world%');

SELECT like(CAST('hello' AS FixedString(5)), 'xyz%');

SELECT like(CAST('hello' AS FixedString(5)), 'hell%');

SELECT like(CAST('hello' AS FixedString(5)), 'orld%');

SELECT like(CAST('hello' AS FixedString(5)), '%he%o%');

SELECT like(CAST('hello' AS FixedString(5)), '%w%ld%');

SELECT like(CAST('hello' AS FixedString(5)), '%x%z%');

SELECT like(CAST('hello' AS FixedString(5)), '%hell_');

SELECT like(CAST('hello' AS FixedString(5)), '_orld%');

SELECT like(CAST('hello' AS FixedString(5)), '%he__o%');

SELECT like(CAST('hello' AS FixedString(5)), '%w__ld%');

SELECT like(CAST('hello' AS FixedString(5)), 'hell_');

SELECT like(CAST('hello' AS FixedString(5)), '_orld');

SELECT like(CAST('hello' AS FixedString(5)), 'helloworld');

SELECT like(CAST('hello' AS FixedString(5)), '%helloworld%');

SELECT like(CAST('hello' AS FixedString(5)), '%elloworl%');

SELECT like(CAST('hello' AS FixedString(5)), '%ow%');

SELECT like(CAST('hello' AS FixedString(5)), '%o%w%');

SELECT like(CAST('hello' AS FixedString(5)), '%o%');

SELECT like(CAST('hello' AS FixedString(5)), '%l%');

SELECT like(CAST('hello' AS FixedString(5)), '%l%o%');

SELECT like(CAST('hello' AS FixedString(5)), '%o%l%');