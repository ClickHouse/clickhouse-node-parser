CREATE TABLE test
(
    answer Enum8('Question' = 1, 'Answer' = 2, 'Wiki' = 3, 'TagWikiExcerpt' = 4, 'TagWiki' = 5, 'ModeratorNomination' = 6, 'WikiPlaceholder' = 7, 'PrivilegeWiki' = 8)
)
ENGINE = Memory;

SELECT *
FROM test
ORDER BY `ALL` ASC;

CREATE TABLE test
(
    answer Enum8('1' = 2, '2' = 1, 'Wiki' = 3)
)
ENGINE = Memory;