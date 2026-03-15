CREATE TABLE array (arr Array(Nullable(Float64))) ENGINE = Memory;
select * from array where arr > [12.2];
select * from array where arr > [null, 12.2];
select * from array where arr > [null, 12];
