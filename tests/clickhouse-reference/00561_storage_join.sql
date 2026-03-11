select * from joinbug;
select id, id2, val, val2, created
from ( SELECT toUInt64(arrayJoin(range(50))) AS id2 ) js1
SEMI LEFT JOIN joinbug_join using id2;
-- type conversion
SELECT * FROM ( SELECT toUInt32(11) AS id2 ) AS js1 SEMI LEFT JOIN joinbug_join USING (id2);
-- can't convert right side in case on storage join
SELECT * FROM ( SELECT toInt64(11) AS id2 ) AS js1 SEMI LEFT JOIN joinbug_join USING (id2); -- { serverError TYPE_MISMATCH, 386 }
