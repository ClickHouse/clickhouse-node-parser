select X.*, Y.* from X inner join Y using id order by X.id, Y.id, X.x_name, Y.y_name;
select s.*, j.* from (select * from X) as s inner join (select * from Y) as j using id order by s.id, s.id, s.x_name, j.y_name;
select X.*, Y.* from X left join Y using id order by X.id, Y.id, X.x_name, Y.y_name;
select s.*, j.* from (select * from X) as s left join (select * from Y) as j using id order by s.id, j.id, s.x_name, j.y_name;
select X.*, Y.* from X right join Y using id order by X.id, Y.id, X.x_name, Y.y_name;
select s.*, j.* from (select * from X) as s right join (select * from Y) as j using id order by s.id, j.id, s.x_name, j.y_name;
select X.*, Y.* from X full join Y using id order by X.id, Y.id, X.x_name, Y.y_name;
select s.*, j.* from (select * from X) as s full join (select * from Y) as j using id order by s.id, j.id, s.x_name, j.y_name;
