create table t (x Array(`ab`)) engine Memory; -- { serverError UNKNOWN_TYPE }
create table t (x `ab`) engine Memory; -- { serverError UNKNOWN_TYPE }
create table t (x `Int64`) engine Memory;
