SELECT id, timestamp, payload FROM events WHERE (organisation_id = reinterpretAsUUID(1)) AND (session_id = reinterpretAsUUID(0)) ORDER BY timestamp, payload, id ASC;
