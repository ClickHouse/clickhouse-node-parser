select number, 'Hello' as str, range(number) as arr from numbers(3) format JSONObjectEachRow;
select * from file(02417_data.jsonObjectEachRow);
