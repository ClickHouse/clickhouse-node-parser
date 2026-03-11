SELECT date_field
FROM file(concat(current_database(), '_03259.orc'), 'ORC')
ORDER BY number ASC;