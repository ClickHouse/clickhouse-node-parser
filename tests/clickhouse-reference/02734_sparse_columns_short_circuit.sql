SELECT sum(if(a % 10 = 0, CAST(b, 'UInt8'), 0)) FROM t_sparse_short_circuit;
