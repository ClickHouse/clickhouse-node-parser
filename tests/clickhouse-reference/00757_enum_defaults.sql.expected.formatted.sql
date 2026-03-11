SELECT *
FROM auto_assign_enum;

SELECT CAST(x, 'Int8')
FROM auto_assign_enum;

SELECT *
FROM auto_assign_enum
WHERE x = 1;

SELECT *
FROM auto_assign_enum1;

SELECT CAST(x, 'Int16')
FROM auto_assign_enum1;

SELECT *
FROM auto_assign_enum1
WHERE x = -999;

SELECT CAST(x, 'Int8')
FROM auto_assign_enum2;