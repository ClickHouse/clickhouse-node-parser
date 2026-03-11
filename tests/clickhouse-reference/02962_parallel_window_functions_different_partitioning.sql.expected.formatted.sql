SELECT
    depname,
    sum(salary) OVER (PARTITION BY depname ORDER BY empno ASC) AS depsalary
FROM empsalary
ORDER BY depsalary ASC;

SELECT
    depname,
    sum(salary) OVER (PARTITION BY depname ORDER BY empno ASC) AS depsalary,
    min(salary) OVER (PARTITION BY depname, empno ORDER BY enroll_date ASC) AS depminsalary
FROM empsalary
ORDER BY depsalary ASC;