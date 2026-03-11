select array from aliases_test;
select struct.key, struct.value from aliases_test;
select struct.key, struct.value from aliases_test array join struct;
select struct.key, struct.value from aliases_test array join struct as struct;
select class.key, class.value from aliases_test array join struct as class;
