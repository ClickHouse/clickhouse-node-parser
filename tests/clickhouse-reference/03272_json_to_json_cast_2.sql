select json::JSON(max_dynamic_paths=3) as json2, JSONAllPaths(json2), JSONSharedDataPaths(json2), json2.k1, json2.k2, json2.k3, json2.k4 from test;
select json::JSON(max_dynamic_paths=2) as json2, JSONAllPaths(json2), JSONSharedDataPaths(json2), json2.k1, json2.k2, json2.k3, json2.k4 from test;
select json::JSON(max_dynamic_paths=1) as json2, JSONAllPaths(json2), JSONSharedDataPaths(json2), json2.k1, json2.k2, json2.k3, json2.k4 from test;
select json::JSON(max_dynamic_paths=0) as json2, JSONAllPaths(json2), JSONSharedDataPaths(json2), json2.k1, json2.k2, json2.k3, json2.k4 from test;
select distinct arrayJoin(JSONAllPaths(json2)) from (select json::JSON(max_dynamic_paths=3) as json2 from test) order by all;
select distinct arrayJoin(JSONAllPaths(json2)) from (select json::JSON(max_dynamic_paths=2) as json2 from test) order by all;
select distinct arrayJoin(JSONAllPaths(json2)) from (select json::JSON(max_dynamic_paths=1) as json2 from test) order by all;
select distinct arrayJoin(JSONAllPaths(json2)) from (select json::JSON(max_dynamic_paths=0) as json2 from test) order by all;
