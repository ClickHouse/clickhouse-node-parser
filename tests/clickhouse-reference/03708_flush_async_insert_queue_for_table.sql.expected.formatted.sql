SELECT
    '`test_table with spaces`',
    count()
FROM `test_table with spaces`;

SELECT
    '`this.is.a.valid.databasename`.`test_table with spaces`',
    count()
FROM `this.is.a.valid.databasename`.`test_table with spaces`;