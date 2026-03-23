-- Tags: no-parallel
SYSTEM drop  user if exists "       ";

SYSTEM drop  user if exists '   spaces';

SYSTEM drop  user if exists 'spaces    ';

SYSTEM drop  user if exists " spaces ";

SYSTEM drop  user if exists "test 01119";

SYSTEM drop  user if exists "Вася Пупкин";

SYSTEM drop  user if exists "无名氏 ";

SYSTEM drop  user if exists "🙈 🙉 🙊";

CREATE USER `       `;

CREATE USER '   spaces';

CREATE USER 'spaces    ';

CREATE USER ` INTERSERVER SECRET `; -- { serverError BAD_ARGUMENTS }

CREATE USER 'test 01119';

CREATE USER `Вася Пупкин`;

CREATE USER `无名氏 `;

CREATE USER `🙈 🙉 🙊`;

SELECT
    length(name),
    name,
    '.'
FROM `system`.users
WHERE position(name, ' ') != 0
ORDER BY name ASC;

SYSTEM drop  user "       ";

SYSTEM drop  user '   spaces';

SYSTEM drop  user 'spaces    ';

SYSTEM drop  user " spaces ";

SYSTEM drop  user "Вася Пупкин";

SYSTEM drop  user "无名氏 ";

SYSTEM drop  user "🙈 🙉 🙊";