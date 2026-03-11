
SELECT * FROM or_bug WHERE (key = 1) OR false OR false;
SELECT * FROM or_bug WHERE (key = 1) OR false;
SELECT * FROM or_bug WHERE (key = 1);

select * from forms where text_field like '%this%' or 0 = 1 or 0 = 1;
select * from forms where text_field like '%this%' or 0 = 1;
select * from forms where text_field like '%this%';
