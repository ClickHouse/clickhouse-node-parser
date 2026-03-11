SELECT
    entityIri,
    `watchers-count`,
    `time-repeating-average`,
    `reject-views-duration-average`,
    `repeating-views-count-average`,
    `views-duration-average`,
    `watched-part-average`,
    `rejects-count`,
    `progress-average`,
    `views-count-before-full-watched-average`,
    duration,
    `full-watched-learners-count`,
    `overall-watchers-count`,
    `overall-full-watched-learners-count`,
    `views-count`,
    `time-before-full-watched-average`,
    if(isNaN((`overall-full-watched-learners-count` / `overall-watchers-count`) * 100), 0, (`overall-full-watched-learners-count` / `overall-watchers-count`) * 100) AS `overall-watched-part`,
    if(isNaN((`full-watched-learners-count` / `watchers-count` * 100)), 0, (`full-watched-learners-count` / `watchers-count` * 100)) AS `full-watched-part`,
    if(isNaN((`rejects-count` / `views-count` * 100)), 0, (`rejects-count` / `views-count` * 100)) AS `rejects-part`
FROM (
        SELECT
            entityIri,
            `watchers-count`,
            `time-repeating-average`,
            `reject-views-duration-average`,
            `repeating-views-count-average`,
            `views-duration-average`,
            `watched-part-average`,
            `rejects-count`,
            `progress-average`,
            `views-count-before-full-watched-average`,
            duration,
            `full-watched-learners-count`,
            `overall-watchers-count`,
            `overall-full-watched-learners-count`,
            `views-count`,
            `time-before-full-watched-average`
        FROM
            (
                SELECT
                    entityIri,
                    `watchers-count`,
                    `time-repeating-average`,
                    `reject-views-duration-average`,
                    `repeating-views-count-average`,
                    `views-duration-average`,
                    `watched-part-average`,
                    `rejects-count`,
                    `progress-average`,
                    `views-count-before-full-watched-average`,
                    duration,
                    `full-watched-learners-count`,
                    `overall-watchers-count`,
                    `overall-full-watched-learners-count`,
                    `views-count`
                FROM
                    (
                        SELECT
                            entityIri,
                            `watchers-count`,
                            `time-repeating-average`,
                            `reject-views-duration-average`,
                            `repeating-views-count-average`,
                            `views-duration-average`,
                            `watched-part-average`,
                            `rejects-count`,
                            `progress-average`,
                            `views-count-before-full-watched-average`,
                            duration,
                            `full-watched-learners-count`,
                            `overall-watchers-count`,
                            `overall-full-watched-learners-count`
                        FROM
                            (
                                SELECT
                                    entityIri,
                                    `watchers-count`,
                                    `time-repeating-average`,
                                    `reject-views-duration-average`,
                                    `repeating-views-count-average`,
                                    `views-duration-average`,
                                    `watched-part-average`,
                                    `rejects-count`,
                                    `progress-average`,
                                    `views-count-before-full-watched-average`,
                                    duration,
                                    `full-watched-learners-count`,
                                    `overall-watchers-count`
                                FROM
                                    (
                                        SELECT
                                            entityIri,
                                            `watchers-count`,
                                            `time-repeating-average`,
                                            `reject-views-duration-average`,
                                            `repeating-views-count-average`,
                                            `views-duration-average`,
                                            `watched-part-average`,
                                            `rejects-count`,
                                            `progress-average`,
                                            `views-count-before-full-watched-average`,
                                            duration,
                                            `full-watched-learners-count`
                                        FROM
                                            (
                                                SELECT
                                                    entityIri,
                                                    `watchers-count`,
                                                    `time-repeating-average`,
                                                    `reject-views-duration-average`,
                                                    `repeating-views-count-average`,
                                                    `views-duration-average`,
                                                    `watched-part-average`,
                                                    `rejects-count`,
                                                    `progress-average`,
                                                    `views-count-before-full-watched-average`,
                                                    duration
                                                FROM
                                                    (
                                                        SELECT
                                                            entityIri,
                                                            `watchers-count`,
                                                            `time-repeating-average`,
                                                            `reject-views-duration-average`,
                                                            `repeating-views-count-average`,
                                                            `views-duration-average`,
                                                            `watched-part-average`,
                                                            `rejects-count`,
                                                            `progress-average`,
                                                            `views-count-before-full-watched-average`
                                                        FROM
                                                            (
                                                                SELECT
                                                                    entityIri,
                                                                    `watchers-count`,
                                                                    `time-repeating-average`,
                                                                    `reject-views-duration-average`,
                                                                    `repeating-views-count-average`,
                                                                    `views-duration-average`,
                                                                    `watched-part-average`,
                                                                    `rejects-count`,
                                                                    `progress-average`
                                                                FROM
                                                                    (
                                                                        SELECT
                                                                            entityIri,
                                                                            `watchers-count`,
                                                                            `time-repeating-average`,
                                                                            `reject-views-duration-average`,
                                                                            `repeating-views-count-average`,
                                                                            `views-duration-average`,
                                                                            `watched-part-average`,
                                                                            `rejects-count`
                                                                        FROM
                                                                            (
                                                                                SELECT
                                                                                    entityIri,
                                                                                    `watchers-count`,
                                                                                    `time-repeating-average`,
                                                                                    `reject-views-duration-average`,
                                                                                    `repeating-views-count-average`,
                                                                                    `views-duration-average`,
                                                                                    `watched-part-average`
                                                                                FROM
                                                                                    (
                                                                                        SELECT
                                                                                            entityIri,
                                                                                            `watchers-count`,
                                                                                            `time-repeating-average`,
                                                                                            `reject-views-duration-average`,
                                                                                            `repeating-views-count-average`,
                                                                                            `views-duration-average`
                                                                                        FROM
                                                                                            (
                                                                                                SELECT
                                                                                                    entityIri,
                                                                                                    `watchers-count`,
                                                                                                    `time-repeating-average`,
                                                                                                    `reject-views-duration-average`,
                                                                                                    `repeating-views-count-average`
                                                                                                FROM
                                                                                                    (
                                                                                                        SELECT
                                                                                                            entityIri,
                                                                                                            `watchers-count`,
                                                                                                            `time-repeating-average`,
                                                                                                            `reject-views-duration-average`
                                                                                                        FROM
                                                                                                            (
                                                                                                                SELECT
                                                                                                                    entityIri,
                                                                                                                    `watchers-count`,
                                                                                                                    `time-repeating-average`
                                                                                                                FROM
                                                                                                                    (
                                                                                                                        SELECT
                                                                                                                            entityIri,
                                                                                                                            `watchers-count`
                                                                                                                        FROM
                                                                                                                            (
                                                                                                                                SELECT entityIri
                                                                                                                                FROM dict_string
                                                                                                                            )
                                                                                                                        LEFT JOIN (
                                                                                                                                SELECT
                                                                                                                                    uniq(learnerId) AS `watchers-count`,
                                                                                                                                    entityIri
                                                                                                                                FROM
                                                                                                                                    video_views FINAL
                                                                                                                                ARRAY JOIN views
                                                                                                                                PREWHERE entityIri IN (dict_string)
                                                                                                                                    AND courseId = 1
                                                                                                                                WHERE learnerId IN (dict_ui64)
                                                                                                                                GROUP BY entityIri
                                                                                                                            )
                                                                                                                            USING (entityIri)
                                                                                                                    )
                                                                                                                LEFT JOIN (
                                                                                                                        SELECT
                                                                                                                            avg(viewDurationSum) AS `time-repeating-average`,
                                                                                                                            entityIri
                                                                                                                        FROM (
                                                                                                                                SELECT
                                                                                                                                    sum(views.viewDuration) AS viewDurationSum,
                                                                                                                                    entityIri,
                                                                                                                                    learnerId
                                                                                                                                FROM
                                                                                                                                    video_views FINAL
                                                                                                                                ARRAY JOIN views
                                                                                                                                PREWHERE entityIri IN (dict_string)
                                                                                                                                    AND courseId = 1
                                                                                                                                WHERE views.repeatingView = 1
                                                                                                                                    AND learnerId IN (dict_ui64)
                                                                                                                                GROUP BY
                                                                                                                                    learnerId,
                                                                                                                                    entityIri
                                                                                                                            )
                                                                                                                        GROUP BY entityIri
                                                                                                                    )
                                                                                                                    USING (entityIri)
                                                                                                            )
                                                                                                        LEFT JOIN (
                                                                                                                SELECT
                                                                                                                    avg(views.viewDuration) AS `reject-views-duration-average`,
                                                                                                                    entityIri
                                                                                                                FROM
                                                                                                                    video_views FINAL
                                                                                                                ARRAY JOIN views
                                                                                                                PREWHERE entityIri IN (dict_string)
                                                                                                                    AND courseId = 1
                                                                                                                WHERE views.reject = 1
                                                                                                                    AND learnerId IN (dict_ui64)
                                                                                                                GROUP BY entityIri
                                                                                                            )
                                                                                                            USING (entityIri)
                                                                                                    )
                                                                                                LEFT JOIN (
                                                                                                        SELECT
                                                                                                            avg(viewsCount) AS `repeating-views-count-average`,
                                                                                                            entityIri
                                                                                                        FROM (
                                                                                                                SELECT
                                                                                                                    count() AS viewsCount,
                                                                                                                    learnerId,
                                                                                                                    entityIri
                                                                                                                FROM
                                                                                                                    video_views FINAL
                                                                                                                ARRAY JOIN views
                                                                                                                PREWHERE courseId = 1
                                                                                                                    AND entityIri IN (dict_string)
                                                                                                                WHERE views.repeatingView = 1
                                                                                                                    AND learnerId IN (dict_ui64)
                                                                                                                GROUP BY
                                                                                                                    learnerId,
                                                                                                                    entityIri
                                                                                                            )
                                                                                                        GROUP BY entityIri
                                                                                                    )
                                                                                                    USING (entityIri)
                                                                                            )
                                                                                        LEFT JOIN (
                                                                                                SELECT
                                                                                                    avg(views.viewDuration) AS `views-duration-average`,
                                                                                                    entityIri
                                                                                                FROM
                                                                                                    video_views FINAL
                                                                                                ARRAY JOIN views
                                                                                                PREWHERE entityIri IN (dict_string)
                                                                                                    AND courseId = 1
                                                                                                WHERE learnerId IN (dict_ui64)
                                                                                                GROUP BY entityIri
                                                                                            )
                                                                                            USING (entityIri)
                                                                                    )
                                                                                LEFT JOIN (
                                                                                        SELECT
                                                                                            avg(views.watchedPart) AS `watched-part-average`,
                                                                                            entityIri
                                                                                        FROM
                                                                                            video_views FINAL
                                                                                        ARRAY JOIN views
                                                                                        PREWHERE entityIri IN (dict_string)
                                                                                            AND courseId = 1
                                                                                        WHERE learnerId IN (dict_ui64)
                                                                                        GROUP BY entityIri
                                                                                    )
                                                                                    USING (entityIri)
                                                                            )
                                                                        LEFT JOIN (
                                                                                SELECT
                                                                                    count() AS `rejects-count`,
                                                                                    entityIri
                                                                                FROM
                                                                                    video_views FINAL
                                                                                ARRAY JOIN views
                                                                                PREWHERE entityIri IN (dict_string)
                                                                                    AND courseId = 1
                                                                                WHERE views.reject = 1
                                                                                    AND learnerId IN (dict_ui64)
                                                                                GROUP BY entityIri
                                                                            )
                                                                            USING (entityIri)
                                                                    )
                                                                LEFT JOIN (
                                                                        SELECT
                                                                            avg(progressMax) AS `progress-average`,
                                                                            entityIri
                                                                        FROM (
                                                                                SELECT
                                                                                    max(views.progress) AS progressMax,
                                                                                    entityIri,
                                                                                    learnerId
                                                                                FROM
                                                                                    video_views FINAL
                                                                                ARRAY JOIN views
                                                                                PREWHERE entityIri IN (dict_string)
                                                                                    AND courseId = 1
                                                                                WHERE learnerId IN (dict_ui64)
                                                                                GROUP BY
                                                                                    learnerId,
                                                                                    entityIri
                                                                            )
                                                                        GROUP BY entityIri
                                                                    )
                                                                    USING (entityIri)
                                                            )
                                                        LEFT JOIN (
                                                                SELECT
                                                                    avg(fullWatchedViews) AS `views-count-before-full-watched-average`,
                                                                    entityIri
                                                                FROM video_views FINAL
                                                                PREWHERE entityIri IN (dict_string)
                                                                    AND courseId = 1
                                                                WHERE learnerId IN (dict_ui64)
                                                                GROUP BY entityIri
                                                            )
                                                            USING (entityIri)
                                                    )
                                                LEFT JOIN (
                                                        SELECT
                                                            any(duration) AS duration,
                                                            entityIri
                                                        FROM video_views FINAL
                                                        PREWHERE entityIri IN (dict_string)
                                                            AND courseId = 1
                                                        WHERE learnerId IN (dict_ui64)
                                                        GROUP BY entityIri
                                                    )
                                                    USING (entityIri)
                                            )
                                        LEFT JOIN (
                                                SELECT
                                                    uniq(learnerId) AS `full-watched-learners-count`,
                                                    entityIri
                                                FROM video_views FINAL
                                                PREWHERE entityIri IN (dict_string)
                                                    AND courseId = 1
                                                WHERE fullWatched = 1
                                                    AND learnerId IN (dict_ui64)
                                                GROUP BY entityIri
                                            )
                                            USING (entityIri)
                                    )
                                LEFT JOIN (
                                        SELECT
                                            uniq(learnerId) AS `overall-watchers-count`,
                                            entityIri
                                        FROM
                                            video_views FINAL
                                        ARRAY JOIN views
                                        PREWHERE entityIri IN (dict_string)
                                            AND courseId = 1
                                        WHERE learnerId IN (dict_ui64)
                                        GROUP BY entityIri
                                    )
                                    USING (entityIri)
                            )
                        LEFT JOIN (
                                SELECT
                                    uniq(learnerId) AS `overall-full-watched-learners-count`,
                                    entityIri
                                FROM video_views FINAL
                                PREWHERE entityIri IN (dict_string)
                                    AND courseId = 1
                                WHERE fullWatched = 1
                                    AND learnerId IN (dict_ui64)
                                GROUP BY entityIri
                            )
                            USING (entityIri)
                    )
                LEFT JOIN (
                        SELECT
                            count() AS `views-count`,
                            entityIri
                        FROM
                            video_views FINAL
                        ARRAY JOIN views
                        PREWHERE entityIri IN (dict_string)
                            AND courseId = 1
                        WHERE learnerId IN (dict_ui64)
                        GROUP BY entityIri
                    )
                    USING (entityIri)
            )
        LEFT JOIN (
                SELECT
                    avg(fullWatchedTime) AS `time-before-full-watched-average`,
                    entityIri
                FROM video_views FINAL
                PREWHERE entityIri IN (dict_string)
                    AND courseId = 1
                WHERE learnerId IN (dict_ui64)
                GROUP BY entityIri
            )
            USING (entityIri)
    );

SELECT count()
FROM (
        SELECT
            x,
            count() AS c
        FROM (
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
                UNION ALL
                SELECT *
                FROM (
                        SELECT *
                        FROM sample_00632
                        WHERE x > 0
                    )
            )
        GROUP BY x
        ORDER BY x ASC
    );