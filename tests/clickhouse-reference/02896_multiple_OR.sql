CREATE TABLE or_bug (key UInt8) ENGINE=MergeTree ORDER BY key;
-- { echoOn }
SELECT * FROM or_bug WHERE (key = 1) OR false OR false;
SELECT * FROM or_bug WHERE (key = 1) OR false;
SELECT * FROM or_bug WHERE (key = 1);
CREATE TABLE forms
(
   `form_id` FixedString(24),
   `text_field` String
)
ENGINE = MergeTree
PRIMARY KEY form_id
ORDER BY form_id;
-- { echoOn }
select * from forms where text_field like '%this%' or 0 = 1 or 0 = 1;
select * from forms where text_field like '%this%' or 0 = 1;
select * from forms where text_field like '%this%';
