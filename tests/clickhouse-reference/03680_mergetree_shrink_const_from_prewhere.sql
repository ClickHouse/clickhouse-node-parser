-- Here we have condition with a constant "materialize(255)", for which convertToFullColumnIfConst() will return underlying column w/o copying,
-- and later shrinkToFit() will be called from multiple threads on this column, and leads to UB
SELECT v FROM const_node PREWHERE and(materialize(255), *) ORDER BY v;
