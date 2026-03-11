SELECT floor(((ReferrerTimestamp - InstallTimestamp)) / 86400) AS DaysSinceInstallations
FROM
    (
        SELECT
            6534090703218709881 AS DeviceIDHash,
            1458586663 AS InstallTimestamp
        UNION ALL
        SELECT
            2697418689476658272,
            1458561552
    ) AS js1
INNER JOIN (
        SELECT
            1034415739529768519 AS DeviceIDHash,
            1458566664 AS ReferrerTimestamp
        UNION ALL
        SELECT
            2697418689476658272,
            1458561552
    ) AS js2
    USING (DeviceIDHash);