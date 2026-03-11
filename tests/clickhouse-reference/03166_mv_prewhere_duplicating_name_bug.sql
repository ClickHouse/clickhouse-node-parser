select s, lc from mv where not ignore(lc) settings enable_analyzer=0;
select s, lc from mv where not ignore(lc) settings enable_analyzer=1;
