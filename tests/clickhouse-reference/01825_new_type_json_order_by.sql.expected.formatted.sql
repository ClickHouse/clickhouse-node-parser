SELECT dummy
FROM `system`.one
ORDER BY materialize('{"k":"v"}'::JSON) ASC;

SELECT dummy
FROM `system`.one
ORDER BY
    materialize('{"k":"v"}'::JSON) ASC,
    dummy ASC;

SELECT materialize('{"k":"v"}'::JSON)
SETTINGS extremes = 1;