SELECT quantilePrometheusHistogram(0.9)(args.1, args.2 + number)
FROM (
        SELECT
            arrayJoin(arrayZip([0.0, 0.5, 1.0, +Inf], [0.0, 10.0, 11.0, 12.0])) AS args,
            number
        FROM numbers(10)
    )
GROUP BY number
ORDER BY number ASC;

SELECT quantilePrometheusHistogram(0.9)(toFloat32(args.1), args.2 + number)
FROM (
        SELECT
            arrayJoin(arrayZip([0.0, 0.5, 1.0, +Inf], [0.0, 10.0, 11.0, 12.0])) AS args,
            number
        FROM numbers(10)
    )
GROUP BY number
ORDER BY number ASC;

SELECT quantilePrometheusHistogram(0.9)(args.1, args.2 + number)
FROM (
        SELECT
            arrayJoin(arrayZip([0.0, 0.5, 1.0, +Inf], [0, 10, 11, 12])) AS args,
            number
        FROM numbers(10)
    )
GROUP BY number
ORDER BY number ASC;

SELECT quantilePrometheusHistogram(0.9)(args.1, args.2)
FROM (
        SELECT arrayJoin(arrayZip([0.0, 0.5, 1.0], [0.0, 10.0, 11.0])) AS args
    );

SELECT quantilePrometheusHistogram(0.5)(inf, 10.0);

SELECT quantilePrometheusHistogram(0.2)(args.1, args.2)
FROM (
        SELECT arrayJoin(arrayZip([0.5, 1.0, 2.0, +Inf], [5.0, 10.0, 13.0, 15.0])) AS args
    );

SELECT quantilePrometheusHistogram(0.2)(args.1, args.2)
FROM (
        SELECT arrayJoin(arrayZip([-0.5, 0.0, 1.0, +Inf], [5.0, 10.0, 13.0, 15.0])) AS args
    );

SELECT quantilesPrometheusHistogram(0, 0.1, 0.3, 0.5, 0.7, 0.9, 1)(args.1, args.2 + number)
FROM (
        SELECT
            arrayJoin(arrayZip([0.0, 0.5, 1.0, +Inf], [0.0, 10.0, 11.0, 12.0])) AS args,
            number
        FROM numbers(10)
    )
GROUP BY number
ORDER BY number ASC;