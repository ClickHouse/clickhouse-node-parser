SELECT count() != 0
FROM (
        SELECT definer
        FROM `system`.tables
    );