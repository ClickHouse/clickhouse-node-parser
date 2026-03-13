-- Tags: no-object-storage, no-fasttest
SELECT *
FROM `system`.codecs
ORDER BY `all` ASC;

SELECT count()
FROM `system`.codecs;

SELECT name
FROM `system`.`columns`
WHERE table = 'codecs'
    AND database = 'system';