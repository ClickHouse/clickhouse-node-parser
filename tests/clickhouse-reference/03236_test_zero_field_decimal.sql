CREATE TABLE users_03236_zero (uid Int16, name String, num Int16) ENGINE=Memory;
select sum(num/toDecimal256(1000, 18)) from users_03236_zero;
