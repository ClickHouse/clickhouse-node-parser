SELECT '--- notEmpty';
select * from count_lc_test where notEmpty(arr);
select * from count_lc_test where empty(arr);
select * from count_lc_test where arr = [];
select * from count_lc_test where arr != [];
select * from count_lc_test where arr > [];
select * from count_lc_test where arr < [];
select * from count_lc_test where arr >= [];
select * from count_lc_test where arr <= [];
