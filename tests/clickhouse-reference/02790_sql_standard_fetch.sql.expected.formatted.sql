SELECT
    transform(name, ['Henry', 'Irene', 'Dave', 'Cindy'], ['Henry or Irene', 'Henry or Irene', 'Dave or Cindy', 'Dave or Cindy']) AS name,
    department,
    salary
FROM (
        SELECT *
        FROM employees
        ORDER BY
            id ASC,
            name ASC,
            department ASC,
            salary ASC
    )
ORDER BY salary DESC
LIMIT 5
FORMAT PrettyCompactNoEscapes;

SELECT
    transform(name, ['Henry', 'Irene', 'Dave', 'Cindy'], ['Henry or Irene', 'Henry or Irene', 'Dave or Cindy', 'Dave or Cindy']) AS name,
    department,
    salary
FROM (
        SELECT *
        FROM employees
        ORDER BY
            id ASC,
            name ASC,
            department ASC,
            salary ASC
    )
ORDER BY salary DESC
LIMIT 5
FORMAT PrettyCompactNoEscapes;

SELECT
    transform(name, ['Henry', 'Irene', 'Dave', 'Cindy'], ['Henry or Irene', 'Henry or Irene', 'Dave or Cindy', 'Dave or Cindy']) AS name,
    department,
    salary
FROM (
        SELECT *
        FROM employees
        ORDER BY
            id ASC,
            name ASC,
            department ASC,
            salary ASC
    )
ORDER BY salary DESC
LIMIT 5 WITH TIES
FORMAT PrettyCompactNoEscapes;

SELECT
    transform(name, ['Henry', 'Irene', 'Dave', 'Cindy'], ['Henry or Irene', 'Henry or Irene', 'Dave or Cindy', 'Dave or Cindy']) AS name,
    department,
    salary
FROM (
        SELECT *
        FROM employees
        ORDER BY
            id ASC,
            name ASC,
            department ASC,
            salary ASC
    )
ORDER BY salary DESC
LIMIT 5
OFFSET 3
FORMAT PrettyCompactNoEscapes;

SELECT
    transform(name, ['Henry', 'Irene', 'Dave', 'Cindy'], ['Henry or Irene', 'Henry or Irene', 'Dave or Cindy', 'Dave or Cindy']) AS name,
    department,
    salary
FROM (
        SELECT *
        FROM employees
        ORDER BY
            id ASC,
            name ASC,
            department ASC,
            salary ASC
    )
ORDER BY salary DESC
LIMIT 5
OFFSET 3
FORMAT PrettyCompactNoEscapes;