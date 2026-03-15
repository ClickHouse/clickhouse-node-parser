create table ax (A Int64, B Int64) Engine = Memory;
create table bx (A Int64) Engine = Memory;
select * from bx, ax where ax.A = bx.A and ax.B in (1,2);
