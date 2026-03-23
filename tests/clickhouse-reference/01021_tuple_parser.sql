SELECT toTypeName((1,)), (1,);
CREATE TABLE tuple_values (t Tuple(int)) ENGINE = Memory;
INSERT INTO tuple_values VALUES ((1)), ((2,));
