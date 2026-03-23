-- { echoOn }  
SELECT fromUnixTimestampInJodaSyntax(1669804872, 'G', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'GG', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'GGG', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'GGGG', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'GGGGG', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'C', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'CC', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'CCC', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'Y', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'YY', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'YYY', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'YYYY', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'YYYYY', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'e', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'ee', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'EEE', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'EEEE', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'EEEEE', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'D', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'DD', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'DDD', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'M', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'MM', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'MMM', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'MMMM', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'a', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'aa', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'aaa', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'K', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'KK', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'KKK', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'h', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'hh', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'hhh', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 's', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'ss', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'sss', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'zzzz', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'x', 'UTC');

SELECT fromUnixTimestampInJodaSyntax(1669804872, 'w', 'UTC');

WITH '2018-01-12 22:33:44.55' AS s,

toDateTime64(s, 6) AS datetime64

SELECT fromUnixTimestampInJodaSyntax(datetime64, 'S', 'UTC');

WITH '2018-01-12 22:33:44.55' AS s,

toDateTime64(s, 6) AS datetime64

SELECT fromUnixTimestampInJodaSyntax(datetime64, 'SS', 'UTC');

WITH '2018-01-12 22:33:44.55' AS s,

toDateTime64(s, 6) AS datetime64

SELECT fromUnixTimestampInJodaSyntax(datetime64, 'SSS', 'UTC');

WITH '2018-01-12 22:33:44.55' AS s,

toDateTime64(s, 6) AS datetime64

SELECT fromUnixTimestampInJodaSyntax(datetime64, 'SSSS', 'UTC');

WITH '2018-01-12 22:33:44.55' AS s,

toDateTime64(s, 6) AS datetime64

SELECT fromUnixTimestampInJodaSyntax(datetime64, 'SSSSS', 'UTC');

WITH '2018-01-12 22:33:44.55' AS s,

toDateTime64(s, 6) AS datetime64

SELECT fromUnixTimestampInJodaSyntax(datetime64, 'SSSSSS', 'UTC');

WITH '2018-01-12 22:33:44.55' AS s,

toDateTime64(s, 6) AS datetime64

SELECT fromUnixTimestampInJodaSyntax(datetime64, 'SSSSSSS', 'UTC');

WITH '2018-01-12 22:33:44.55' AS s,

toDateTime64(s, 6) AS datetime64

SELECT fromUnixTimestampInJodaSyntax(datetime64, 'SSSSSSSS', 'UTC');

WITH '2018-01-12 22:33:44.55' AS s,

toDateTime64(s, 6) AS datetime64

SELECT fromUnixTimestampInJodaSyntax(datetime64, 'SSSSSSSSS', 'UTC');