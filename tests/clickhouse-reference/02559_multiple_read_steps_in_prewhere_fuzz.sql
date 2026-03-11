SELECT count() FROM test_02559__fuzz_20 PREWHERE (id2 >= 104) AND ((-9223372036854775808 OR (inf OR -2147483649 OR NULL) OR NULL) OR 1 OR ignore(ignore(id1) OR NULL, id1)) WHERE ignore(id1) = 0;
