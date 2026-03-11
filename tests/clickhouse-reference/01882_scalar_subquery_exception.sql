select
  count()
    /
  (select count() from nums_in_mem_dist where rand() > 0)
from system.one; -- { serverError TOO_MANY_ROWS }
