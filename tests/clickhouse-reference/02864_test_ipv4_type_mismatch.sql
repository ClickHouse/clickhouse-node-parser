SELECT * FROM test ORDER BY ip;
SELECT ip IN IPv4StringToNum('1.1.1.1') FROM test order by ip;
SELECT ip IN ('1.1.1.1') FROM test order by ip;
SELECT ip IN IPv4StringToNum('8.8.8.8') FROM test order by ip;
