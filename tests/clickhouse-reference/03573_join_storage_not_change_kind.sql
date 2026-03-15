CREATE TABLE users (uid UInt64, name String, age UInt8) Engine = Join(ALL, LEFT, uid);
CREATE TABLE events (uid UInt64, user_id UInt64, message String) Engine = Memory;
SELECT event.message, user.name, user.age
FROM events event
LEFT JOIN users user ON event.user_id = user.uid
WHERE user.uid > 0
ORDER BY user.age
;
