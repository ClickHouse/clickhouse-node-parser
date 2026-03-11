SELECT *
FROM users u1 LEFT ANY JOIN
(
    SELECT sum(age)::Nullable(Int64) AS age_sum, name
    FROM users
    GROUP BY name
) u2
ON u1.name = u2.name
WHERE uid < age_sum;
