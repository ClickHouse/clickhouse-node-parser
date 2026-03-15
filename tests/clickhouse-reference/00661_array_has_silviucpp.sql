CREATE TABLE has_function(arr Array(Nullable(String))) ENGINE = Memory;
SELECT arr, has(`arr`, 'str1') FROM has_function;
SELECT has([null, 'str1', 'str2'], 'str1');
