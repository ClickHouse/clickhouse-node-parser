select ignore(x) from (select groupArray(number) x from numbers(3355443)) group by x format Null;
