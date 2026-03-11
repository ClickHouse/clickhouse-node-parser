SELECT uid, count(*) over () FROM users group by ALL FORMAT Null;
