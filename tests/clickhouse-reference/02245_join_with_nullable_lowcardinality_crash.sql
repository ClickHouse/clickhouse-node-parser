select if(t0.country is null ,t2.country,t0.country) "country"
from without_nullable t0 right outer join with_nullable t2 on t0.country=t2.country
ORDER BY 1 DESC;
