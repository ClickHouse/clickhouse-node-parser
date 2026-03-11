SELECT A._appointment_id,
       A._id,
       A._status,
       A._set_by_id,
       A._company_id,
       A._client_id,
       A._type,
       A._at,
       A._vacancy_id,
       A._set_at,
       A._job_requisition_id
FROM appointment_events A ANY
LEFT JOIN
  (SELECT _appointment_id,
          MAX(_set_at) AS max_set_at
   FROM appointment_events
   WHERE _status in ('Created', 'Transferred')
   GROUP BY _appointment_id ) B USING _appointment_id
WHERE A._set_at = B.max_set_at
ORDER BY ALL;
