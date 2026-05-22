-- Tags: no-parallel
drop user if exists "       ";

drop user if exists '   spaces';

drop user if exists 'spaces    ';

drop user if exists " spaces ";

drop user if exists "test 01119";

drop user if exists "Вася Пупкин";

drop user if exists "无名氏 ";

drop user if exists "🙈 🙉 🙊";

CREATE USER `       `;

CREATE USER '   spaces';

CREATE USER 'spaces    ';

CREATE USER ` INTERSERVER SECRET `; -- { serverError BAD_ARGUMENTS }

CREATE USER 'test 01119';

alter user `test 01119` rename to " spaces ";

alter user " spaces " rename to " INTERSERVER SECRET "; -- { serverError BAD_ARGUMENTS }

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

drop user "       ";

drop user '   spaces';

drop user 'spaces    ';

drop user " spaces ";

drop user "Вася Пупкин";

drop user "无名氏 ";

drop user "🙈 🙉 🙊";