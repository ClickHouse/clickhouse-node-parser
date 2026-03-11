SELECT number FROM (select number FROM t ORDER BY number OFFSET 3) WHERE number < NULL;
