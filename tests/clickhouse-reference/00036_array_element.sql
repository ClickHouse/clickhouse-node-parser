CREATE TABLE array_element_test (arr Array(Int32), id Int32) ENGINE = Memory;
select arr[id] from array_element_test;
CREATE TABLE array_element_test (arr Array(Int32), id UInt32) ENGINE = Memory;
CREATE TABLE array_element_test (arr Array(String), id Int32) ENGINE = Memory;
CREATE TABLE array_element_test (arr Array(String), id UInt32) ENGINE = Memory;
CREATE TABLE array_element_test (id UInt32) ENGINE = Memory;
select [1, 2, 3] as arr, arr[id] from array_element_test;
CREATE TABLE array_element_test (id Int32) ENGINE = Memory;
