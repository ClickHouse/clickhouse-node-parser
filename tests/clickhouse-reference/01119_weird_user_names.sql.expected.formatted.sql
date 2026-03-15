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