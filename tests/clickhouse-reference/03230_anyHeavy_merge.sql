CREATE TABLE t (letter String) ENGINE=MergeTree order by () partition by letter;
SELECT anyHeavy(if(letter != 'b', letter, NULL)) FROM t;
