CREATE TABLE replaceall (str FixedString(3)) ENGINE = Memory;
SELECT
    str,
    replaceAll(str, 'o', '*') AS replaced
FROM replaceall
ORDER BY str ASC;
set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE replaceall (date Date DEFAULT today(), fs FixedString(16)) ENGINE = MergeTree(date, (date, fs), 8192);
SELECT fs, replaceAll(fs, '\0', '*')
FROM replaceall
ORDER BY fs ASC;
