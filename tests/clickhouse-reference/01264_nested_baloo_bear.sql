SELECT
    fields.name,
    fields.value
FROM
(
    SELECT
        fields.name,
        fields.value
    FROM LOG_T
)
WHERE has(['node'], fields.value[indexOf(fields.name, 'ProcessName')]);
