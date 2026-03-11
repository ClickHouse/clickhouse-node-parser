SELECT id
FROM
    t
LEFT JOIN joint
    ON t.id = joint.id;