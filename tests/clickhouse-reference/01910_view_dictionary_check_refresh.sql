select 'view' src,* FROM TestTbl_view;
select 'dict' src,* FROM TestTblDict ;
SELECT sleep(3) from numbers(4) settings max_block_size= 1 format Null;
