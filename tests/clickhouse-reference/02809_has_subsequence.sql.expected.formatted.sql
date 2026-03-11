SELECT hasSubsequence('garbage', '');

SELECT hasSubsequence('garbage', 'g');

SELECT hasSubsequence('garbage', 'a');

SELECT hasSubsequence('garbage', 'e');

SELECT hasSubsequence('garbage', 'gr');

SELECT hasSubsequence('garbage', 'ab');

SELECT hasSubsequence('garbage', 'be');

SELECT hasSubsequence('garbage', 'arg');

SELECT hasSubsequence('garbage', 'gra');

SELECT hasSubsequence('garbage', 'rga');

SELECT hasSubsequence('garbage', 'garbage');

SELECT hasSubsequence('garbage', 'garbage1');

SELECT hasSubsequence('garbage', 'arbw');

SELECT hasSubsequence('garbage', materialize(''));

SELECT hasSubsequence('garbage', materialize('arg'));

SELECT hasSubsequence('garbage', materialize('arbw'));

SELECT hasSubsequence(materialize('garbage'), '');

SELECT hasSubsequence(materialize('garbage'), 'arg');

SELECT hasSubsequence(materialize('garbage'), 'arbw');

SELECT hasSubsequence(materialize('garbage'), materialize(''));

SELECT hasSubsequence(materialize('garbage'), materialize('arg'));

SELECT hasSubsequence(materialize('garbage'), materialize('garbage1'));

SELECT hasSubsequenceCaseInsensitive('garbage', 'w');

SELECT hasSubsequenceCaseInsensitive('garbage', 'ARG');

SELECT hasSubsequenceCaseInsensitive('GARGAGE', 'arg');

SELECT hasSubsequenceCaseInsensitive(materialize('garbage'), materialize('w'));

SELECT hasSubsequenceCaseInsensitive(materialize('garbage'), materialize('ARG'));

SELECT hasSubsequenceCaseInsensitive(materialize('GARGAGE'), materialize('arg'));

SELECT hasSubsequence('ClickHouse - столбцовая система управления базами данных', '');

SELECT hasSubsequence('ClickHouse - столбцовая система управления базами данных', 'C');

SELECT hasSubsequence('ClickHouse - столбцовая система управления базами данных', 'С');

SELECT hasSubsequence('ClickHouse - столбцовая система управления базами данных', 'House');

SELECT hasSubsequence('ClickHouse - столбцовая система управления базами данных', 'система');

SELECT hasSubsequence('ClickHouse - столбцовая система управления базами данных', 'ссубд');

SELECT hasSubsequence(materialize('ClickHouse - столбцовая система управления базами данных'), 'субд');

SELECT hasSubsequence(materialize('ClickHouse - столбцовая система управления базами данных'), 'суббд');

SELECT hasSubsequence('ClickHouse - столбцовая система управления базами данных', materialize('стул'));

SELECT hasSubsequence('ClickHouse - столбцовая система управления базами данных', materialize('два стула'));

SELECT hasSubsequence(materialize('ClickHouse - столбцовая система управления базами данных'), materialize('орех'));

SELECT hasSubsequence(materialize('ClickHouse - столбцовая система управления базами данных'), materialize('два ореха'));

SELECT hasSubsequenceCaseInsensitiveUTF8('для онлайн обработки аналитических запросов (OLAP)', 'oltp');

SELECT hasSubsequenceCaseInsensitiveUTF8('для онлайн обработки аналитических запросов (OLAP)', 'оОоОоO');

SELECT hasSubsequenceCaseInsensitiveUTF8('для онлайн обработки аналитических запросов (OLAP)', 'я раб');

SELECT hasSubsequenceCaseInsensitiveUTF8(materialize('для онлайн обработки аналитических запросов (OLAP)'), 'работа');

SELECT hasSubsequenceCaseInsensitiveUTF8(materialize('для онлайн обработки аналитических запросов (OLAP)'), 'work');

SELECT hasSubsequenceCaseInsensitiveUTF8('для онлайн обработки аналитических запросов (OLAP)', materialize('добро)'));

SELECT hasSubsequenceCaseInsensitiveUTF8('для онлайн обработки аналитических запросов (OLAP)', materialize('зло()'));

SELECT hasSubsequenceCaseInsensitiveUTF8(materialize('для онлайн обработки аналитических запросов (OLAP)'), materialize('аналитика'));

SELECT hasSubsequenceCaseInsensitiveUTF8(materialize('для онлайн обработки аналитических запросов (OLAP)'), materialize('аналитика для аналитиков'));

SELECT hasSubsequence(NULL, NULL);

SELECT hasSubsequence(NULL, 'a');

SELECT hasSubsequence(NULL::Nullable(String), 'arg'::Nullable(String));

SELECT hasSubsequence('garbage'::Nullable(String), 'a');

SELECT hasSubsequence('garbage'::Nullable(String), 'arg'::Nullable(String));

SELECT hasSubsequence(materialize('garbage'::Nullable(String)), materialize('arg'::Nullable(String)));