-- Tags: no-ordinary-database

create table data_02491 (key Int) engine=MergeTree() order by tuple() settings old_parts_lifetime=600;
