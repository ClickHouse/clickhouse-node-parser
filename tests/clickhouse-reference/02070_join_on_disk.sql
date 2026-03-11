SELECT id FROM join_on_disk lhs LEFT JOIN (SELECT id FROM join_on_disk GROUP BY id) rhs USING (id) FORMAT Null;
