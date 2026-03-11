SELECT * FROM markdown FORMAT Markdown;
SELECT '!#$%&(*+,-./:<=>?@[^`{|}~' AS a FORMAT Markdown;
SELECT CAST(1 AS Enum('!#$%&(*+,-./:<=>?@[^`{|}~' = 1)) AS a FORMAT Markdown;
SELECT toFixedString('!#$%&(*+,-./:<=>?@[^`{|}~', 25) AS a FORMAT Markdown;
