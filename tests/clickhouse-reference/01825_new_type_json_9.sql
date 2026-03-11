SELECT distinct arrayJoin(JSONAllPathsWithTypes(obj)) as path from t_json order by path;
