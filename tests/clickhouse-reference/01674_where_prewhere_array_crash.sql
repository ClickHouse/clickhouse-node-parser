select x from tab array join arr prewhere x != 0 where arr; -- { serverError UNKNOWN_IDENTIFIER, 59 }
select x from tab array join arr prewhere arr where x != 0; -- { serverError UNKNOWN_IDENTIFIER, 59 }
