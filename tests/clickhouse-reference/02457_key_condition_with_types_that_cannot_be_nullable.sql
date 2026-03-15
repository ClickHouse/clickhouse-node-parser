create table test (Printer LowCardinality(String), IntervalStart DateTime) engine MergeTree partition by (hiveHash(Printer), toYear(IntervalStart)) order by (Printer, IntervalStart);
select Printer from test where Printer='printer1';
