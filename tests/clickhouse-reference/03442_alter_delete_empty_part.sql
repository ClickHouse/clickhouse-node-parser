SELECT count() FROM t_delete_empty_part;
SELECT
    part_name,
    ProfileEvents['MutationTotalParts'],
    ProfileEvents['MutationUntouchedParts'],
    ProfileEvents['MutationCreatedEmptyParts']
FROM system.part_log
WHERE database = currentDatabase() AND table = 't_delete_empty_part' AND event_type = 'MutatePart'
ORDER BY part_name;
