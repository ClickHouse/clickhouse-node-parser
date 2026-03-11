select trimBoth(explain) from (explain pipeline select distinct a from t) where explain like '%InOrder%';
