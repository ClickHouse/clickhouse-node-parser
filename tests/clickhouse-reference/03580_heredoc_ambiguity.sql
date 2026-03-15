SELECT {$1:String} AS x, {$2:String} AS y; -- {$1:String} AS x, {$2:String} AS y
SELECT {$1:String} AS x, {$2:String} AS y UNION ALL SELECT {$1:String} AS x, {$2:String} AS y;
