
SELECT count(), _part FROM 02581_trips GROUP BY _part ORDER BY _part;
SELECT count(), _part FROM 02581_trips WHERE description = '' GROUP BY _part ORDER BY _part;
SELECT count() from 02581_trips WHERE description = '';
