create table tab_00712_1 (a UInt32, b UInt32 alias a + 1, c UInt32) engine = MergeTree order by tuple();
select ignore(_part) from tab_00712_1 prewhere b = 2;
