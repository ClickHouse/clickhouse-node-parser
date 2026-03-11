SELECT mannWhitneyUTest(salary, salary) OVER (ORDER BY salary ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS func FROM 01802_empsalary; -- {serverError BAD_ARGUMENTS}
