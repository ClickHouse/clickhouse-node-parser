-- https://github.com/ClickHouse/ClickHouse/issues/85973#issuecomment-3228974538
SELECT count() != 0
FROM (
        SELECT definer
        FROM `system`.tables
    );