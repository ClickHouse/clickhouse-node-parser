SELECT *
FROM cluster(test_shard_localhost, view((
        SELECT
            toDate({CurrentStart:String}),
            dummy::Date AS x
        FROM `system`.one
        ORDER BY x ASC WITH FILL FROM toDate({CurrentStart:String}) TO toDate({CurrentEnd:String}) + toIntervalDay(1) STEP toIntervalDay(1)
    )));