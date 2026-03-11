SELECT formatDateTime((
        SELECT date
        FROM Dates
    ), '%H%i%S', if(number % 2, 'America/Los_Angeles', 'Europe/Amsterdam'))
FROM numbers(5);

SELECT formatDateTime((
        SELECT materialize(date)
        FROM Dates
    ), '%H%i%S', if(number % 2, 'America/Los_Angeles', 'Europe/Amsterdam'))
FROM numbers(5);

SELECT formatDateTime((
        SELECT materialize(date)
        FROM Dates
    ), '%H%i%S', if(number % 2, '', 'Europe/Amsterdam'))
FROM numbers(5);

SELECT toString((
        SELECT date
        FROM Dates
    ), if(number % 2, 'America/Los_Angeles', 'Europe/Amsterdam'))
FROM numbers(5);

SELECT toString((
        SELECT materialize(date)
        FROM Dates
    ), if(number % 2, 'America/Los_Angeles', 'Europe/Amsterdam'))
FROM numbers(5);

SELECT toString((
        SELECT materialize(date)
        FROM Dates
    ), if(number % 2, 'America/Los_Angeles', ''))
FROM numbers(5);