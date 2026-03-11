SELECT 1 FROM t0 JOIN t0 tx ON t0.c0 <=> tx.c0; -- { serverError INCOMPATIBLE_TYPE_OF_JOIN }
