select '2020-02-01 20:00:00'::DateTime;
select '2020-02-01 20:00:00Z'::DateTime; -- {serverError CANNOT_PARSE_TEXT}
select '01-02-2020 20:00:00Z'::DateTime; -- {serverError CANNOT_PARSE_TEXT}
