select count() from xp_d prewhere toYYYYMM(A) global in (select toYYYYMM(min(A)) from xp_d) where B > -1;
