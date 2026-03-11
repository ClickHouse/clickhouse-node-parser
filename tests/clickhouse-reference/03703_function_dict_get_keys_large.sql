SELECT length(dictGetKeys('dict_big', 'grp', '123')) ;
SELECT arraySum(dictGetKeys('dict_big', 'grp', '123'));
SELECT length(dictGetKeys('dict_big', 'grp', '100000'));
SELECT arraySum(dictGetKeys('dict_big', 'grp', '100000'));
SELECT length(dictGetKeys('dict_big', 'grp_round', '7'));
SELECT arraySum(dictGetKeys('dict_big', 'grp_round', '7'));
SELECT sum(length(dictGetKeys('dict_big', 'grp', toString(number))))
FROM numbers(5);
SELECT sum(arraySum(dictGetKeys('dict_big', 'grp', toString(number))))
FROM numbers(3);
SELECT sum(arraySum(dictGetKeys('dict_big', 'grp', toString(number))))
FROM numbers(100000);
SELECT sum(length(dictGetKeys('dict_big', 'grp_round', '7')))
FROM numbers(2);
SELECT length(dictGetKeys('dict_big', 'grp_round', '1999'));
SELECT arraySum(dictGetKeys('dict_big', 'grp_round', '1999'));
