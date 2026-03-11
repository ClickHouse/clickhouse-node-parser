SELECT value,f FROM bool_test FORMAT JSONEachRow;
SELECT toUInt64(value),f FROM bool_test;
SELECT value,f FROM bool_test where value > 0;
SELECT value,f FROM bool_test order by value FORMAT TSV;
