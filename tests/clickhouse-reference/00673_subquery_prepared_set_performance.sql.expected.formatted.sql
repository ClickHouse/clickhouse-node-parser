CREATE TABLE mergetree_00673
(
    x UInt64
)
ENGINE = MergeTree
ORDER BY x;

SELECT *
FROM (
        SELECT *
        FROM (
                SELECT *
                FROM (
                        SELECT *
                        FROM (
                                SELECT *
                                FROM (
                                        SELECT *
                                        FROM (
                                                SELECT *
                                                FROM (
                                                        SELECT *
                                                        FROM (
                                                                SELECT *
                                                                FROM (
                                                                        SELECT *
                                                                        FROM (
                                                                                SELECT *
                                                                                FROM (
                                                                                        SELECT *
                                                                                        FROM (
                                                                                                SELECT *
                                                                                                FROM (
                                                                                                        SELECT *
                                                                                                        FROM (
                                                                                                                SELECT *
                                                                                                                FROM (
                                                                                                                        SELECT *
                                                                                                                        FROM (
                                                                                                                                SELECT *
                                                                                                                                FROM (
                                                                                                                                        SELECT *
                                                                                                                                        FROM (
                                                                                                                                                SELECT *
                                                                                                                                                FROM (
                                                                                                                                                        SELECT *
                                                                                                                                                        FROM (
                                                                                                                                                                SELECT *
                                                                                                                                                                FROM mergetree_00673
                                                                                                                                                                WHERE x IN (
                                                                                                                                                                        SELECT *
                                                                                                                                                                        FROM numbers(1000000)
                                                                                                                                                                    )
                                                                                                                                                            )
                                                                                                                                                    )
                                                                                                                                            )
                                                                                                                                    )
                                                                                                                            )
                                                                                                                    )
                                                                                                            )
                                                                                                    )
                                                                                            )
                                                                                    )
                                                                            )
                                                                    )
                                                            )
                                                    )
                                            )
                                    )
                            )
                    )
            )
    );

SET force_primary_key = 1;