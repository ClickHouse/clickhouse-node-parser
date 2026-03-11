SELECT * FROM nested_test;
SELECT s, nest.x, nest.y FROM nested_test ARRAY JOIN nest;
SELECT s, nest.x, nest.y FROM nested_test ARRAY JOIN nest.x;
SELECT s, nest.x, nest.y FROM nested_test ARRAY JOIN nest.x, nest.y;
SELECT s, n.x, n.y FROM nested_test ARRAY JOIN nest AS n;
SELECT s, n.x, n.y, nest.x FROM nested_test ARRAY JOIN nest AS n;
SELECT s, n.x, n.y, nest.x, nest.y FROM nested_test ARRAY JOIN nest AS n;
SELECT s, n.x, n.y, nest.x, nest.y, num FROM nested_test ARRAY JOIN nest AS n, arrayEnumerate(nest.x) AS num;
