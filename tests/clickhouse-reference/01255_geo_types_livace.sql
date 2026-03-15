create table tutorial ( inner_poly  Array(Tuple(Int32, Int32)), outer_poly  Array(Tuple(Int32, Int32)) ) engine = Log();
SELECT * FROM tutorial;
