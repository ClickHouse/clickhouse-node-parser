SELECT v
FROM const_node
PREWHERE and(materialize(255), *)
ORDER BY v ASC;