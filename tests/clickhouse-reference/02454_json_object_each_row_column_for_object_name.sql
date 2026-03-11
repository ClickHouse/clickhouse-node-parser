select number, concat('name_', toString(number)) as name from numbers(3) format JSONObjectEachRow;
select number, concat('name_', toString(number)) as name, number + 1 as x from numbers(3) format JSONObjectEachRow;
select concat('name_', toString(number)) as name, number from numbers(3) format JSONObjectEachRow;
select * from file(02454_data.jsonobjecteachrow);
