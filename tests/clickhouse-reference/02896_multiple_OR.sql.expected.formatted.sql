SELECT *
FROM or_bug
WHERE (key = 1)
    OR false
    OR false;

SELECT *
FROM or_bug
WHERE (key = 1)
    OR false;

SELECT *
FROM or_bug
WHERE (key = 1);

SELECT *
FROM forms
WHERE like(text_field, '%this%')
    OR 0 = 1
    OR 0 = 1;

SELECT *
FROM forms
WHERE like(text_field, '%this%')
    OR 0 = 1;

SELECT *
FROM forms
WHERE like(text_field, '%this%');