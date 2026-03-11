select
  {CLICKHOUSE_DATABASE:Identifier}.a.i
from
  {CLICKHOUSE_DATABASE:Identifier}.a,
  {CLICKHOUSE_DATABASE:Identifier}.a as x;
