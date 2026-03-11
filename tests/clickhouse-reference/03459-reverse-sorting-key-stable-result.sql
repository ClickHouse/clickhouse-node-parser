select cityHash64(groupArray(A)) from (select A from t order by A desc limit 10);
select cityHash64(groupArray(A))  from (select A from t order by identity(A) desc limit 10);
