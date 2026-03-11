SELECT *
FROM `system`.macros
WHERE macro = 'test';

SELECT getMacro('test');

SELECT isConstant(getMacro('test'));