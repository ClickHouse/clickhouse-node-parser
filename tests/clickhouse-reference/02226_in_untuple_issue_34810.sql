SELECT * FROM calendar WHERE (year, month) IN ( SELECT (year, month) FROM events32 );
