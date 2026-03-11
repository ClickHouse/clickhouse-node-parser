SELECT alias_first.inn, arrayFirst(t -> isNotNull(t), regInfo.1), arrayFirst(t -> isNotNull(t), regInfo.2)
    FROM first AS alias_first
    INNER JOIN (
        SELECT alias_second.inn, alias_second.sessionId, groupArray((serial, reg)) AS regInfo
            FROM second AS alias_second
            GROUP BY inn, sessionId
    ) AS resp ON (alias_first.inn = resp.inn) AND (alias_first.sessionId = resp.sessionId)
WHERE if('123456789' IS NOT NULL, alias_first.inn = '123456789', 1)
