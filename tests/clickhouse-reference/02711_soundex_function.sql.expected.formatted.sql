SELECT soundex('');

SELECT soundex('12345');

SELECT soundex('341Jons54326ton');

SELECT soundex('A2222222');

SELECT soundex('Fairdale');

SELECT soundex('Faredale');

SELECT soundex('Jon1s2o3n');

SELECT soundex('Jonson');

SELECT soundex('Jonston');

SELECT soundex('McDonald22321');

SELECT soundex('MacDonald');

SELECT soundex('S3344mith0000');

SELECT soundex('Smith');

SELECT '---';

SELECT soundex(col)
FROM tab;

SELECT soundex(toFixedString('Smith', 5));

SELECT soundex(5);