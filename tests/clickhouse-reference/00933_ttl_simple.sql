-- Tags: log-engine
-- disable timezone randomization since otherwise TTL may fail at particular datetime, i.e.:
--
--     SELECT
--         now(),
--         toDate(toTimeZone(now(), 'America/Mazatlan')),
--         today()
--
--     ┌───────────────now()─┬─toDate(toTimeZone(now(), 'America/Mazatlan'))─┬────today()─┐
--     │ 2023-07-24 06:24:06 │                                    2023-07-23 │ 2023-07-24 │
--     └─────────────────────┴───────────────────────────────────────────────┴────────────┘
SET session_timezone = '';
SET allow_suspicious_ttl_expressions = 1;
-- Column TTL works only with wide parts, because it's very expensive to apply it for compact parts

create table ttl_00933_1 (d DateTime, a Int ttl d + interval 1 second, b Int ttl d + interval 1 second) engine = MergeTree order by tuple() partition by toMinute(d) settings min_bytes_for_wide_part = 0;
select sleep(1.1) format Null;
select a, b from ttl_00933_1;
create table ttl_00933_1 (d DateTime, a Int, b Int)
    engine = MergeTree order by toDate(d) partition by tuple() ttl d + interval 1 second
    settings remove_empty_parts = 0;
create table ttl_00933_1 (d DateTime, a Int ttl d + interval 1 DAY) engine = MergeTree order by tuple() partition by toDayOfMonth(d) settings min_bytes_for_wide_part = 0;
select * from ttl_00933_1 order by d;
create table ttl_00933_1 (d DateTime, a Int)
    engine = MergeTree order by tuple() partition by tuple() ttl d + interval 1 day
    settings remove_empty_parts = 0;
create table ttl_00933_1 (d Date, a Int)
    engine = MergeTree order by a partition by toDayOfMonth(d) ttl d + interval 1 day
    settings remove_empty_parts = 0;
create table ttl_00933_1 (b Int, a Int ttl '2000-10-10 00:00:00'::DateTime)
engine = MergeTree order by tuple() partition by tuple() settings min_bytes_for_wide_part = 0;
select * from ttl_00933_1;
create table ttl_00933_1 (b Int, a Int ttl '2100-10-10 00:00:00'::DateTime) engine = MergeTree order by tuple() partition by tuple() settings min_bytes_for_wide_part = 0;
create table ttl_00933_1 (b Int, a Int ttl '2000-10-10'::Date) engine = MergeTree order by tuple() partition by tuple() settings min_bytes_for_wide_part = 0;
create table ttl_00933_1 (b Int, a Int ttl '2100-10-10'::Date) engine = MergeTree order by tuple() partition by tuple() settings min_bytes_for_wide_part = 0;
set send_logs_level = 'fatal';
create table ttl_00933_1 (d DateTime ttl d) engine = MergeTree order by tuple() partition by toSecond(d); -- { serverError ILLEGAL_COLUMN}
create table ttl_00933_1 (d DateTime, a Int ttl d) engine = MergeTree order by a partition by toSecond(d); -- { serverError ILLEGAL_COLUMN}
create table ttl_00933_1 (d DateTime, a Int ttl 2 + 2) engine = MergeTree order by tuple() partition by toSecond(d); -- { serverError BAD_TTL_EXPRESSION }
create table ttl_00933_1 (d DateTime, a Int ttl d - d) engine = MergeTree order by tuple() partition by toSecond(d); -- { serverError BAD_TTL_EXPRESSION }
create table ttl_00933_1 (d DateTime, a Int  ttl d + interval 1 day) engine = Log; -- { serverError BAD_ARGUMENTS }
create table ttl_00933_1 (d DateTime, a Int) engine = Log ttl d + interval 1 day; -- { serverError BAD_ARGUMENTS }
