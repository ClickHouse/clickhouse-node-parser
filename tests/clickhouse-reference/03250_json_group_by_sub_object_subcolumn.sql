select json.^a from test group by json.^a order by toString(json.^a);
