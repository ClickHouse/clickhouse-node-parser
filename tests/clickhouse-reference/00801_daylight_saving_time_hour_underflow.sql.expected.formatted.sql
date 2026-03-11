SELECT
    ignore(toDateTime(370641600, 'Asia/Istanbul') AS t),
    replaceRegexpAll(toString(t), '\\d', 'x'),
    toHour(t) < 24,
    replaceRegexpAll(formatDateTime(t, '%Y-%m-%d %H:%i:%S; %R:%S; %F %T'), '\\d', 'x');