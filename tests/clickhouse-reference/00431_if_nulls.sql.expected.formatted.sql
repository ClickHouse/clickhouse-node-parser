SELECT '---------- constant_true ----------';

SELECT if(constant_true, then_constant, else_constant) AS res
FROM nullable_00431;

SELECT if(constant_true, then_constant, constant_null) AS res
FROM nullable_00431;

SELECT if(constant_true, then_constant, else_non_constant) AS res
FROM nullable_00431;

SELECT if(constant_true, then_constant, else_non_constant_nullable) AS res
FROM nullable_00431;

SELECT if(constant_true, constant_null, else_constant) AS res
FROM nullable_00431;

SELECT if(constant_true, constant_null, constant_null) AS res
FROM nullable_00431;

SELECT if(constant_true, constant_null, else_non_constant) AS res
FROM nullable_00431;

SELECT if(constant_true, constant_null, else_non_constant_nullable) AS res
FROM nullable_00431;

SELECT if(constant_true, then_non_constant, else_constant) AS res
FROM nullable_00431;

SELECT if(constant_true, then_non_constant, constant_null) AS res
FROM nullable_00431;

SELECT if(constant_true, then_non_constant, else_non_constant) AS res
FROM nullable_00431;

SELECT if(constant_true, then_non_constant, else_non_constant_nullable) AS res
FROM nullable_00431;

SELECT if(constant_true, then_non_constant_nullable, else_constant) AS res
FROM nullable_00431;

SELECT if(constant_true, then_non_constant_nullable, constant_null) AS res
FROM nullable_00431;

SELECT if(constant_true, then_non_constant_nullable, else_non_constant) AS res
FROM nullable_00431;

SELECT if(constant_true, then_non_constant_nullable, else_non_constant_nullable) AS res
FROM nullable_00431;

SELECT if(constant_false, then_constant, else_constant) AS res
FROM nullable_00431;

SELECT if(constant_false, then_constant, constant_null) AS res
FROM nullable_00431;

SELECT if(constant_false, then_constant, else_non_constant) AS res
FROM nullable_00431;

SELECT if(constant_false, then_constant, else_non_constant_nullable) AS res
FROM nullable_00431;

SELECT if(constant_false, constant_null, else_constant) AS res
FROM nullable_00431;

SELECT if(constant_false, constant_null, constant_null) AS res
FROM nullable_00431;

SELECT if(constant_false, constant_null, else_non_constant) AS res
FROM nullable_00431;

SELECT if(constant_false, constant_null, else_non_constant_nullable) AS res
FROM nullable_00431;

SELECT if(constant_false, then_non_constant, else_constant) AS res
FROM nullable_00431;

SELECT if(constant_false, then_non_constant, constant_null) AS res
FROM nullable_00431;

SELECT if(constant_false, then_non_constant, else_non_constant) AS res
FROM nullable_00431;

SELECT if(constant_false, then_non_constant, else_non_constant_nullable) AS res
FROM nullable_00431;

SELECT if(constant_false, then_non_constant_nullable, else_constant) AS res
FROM nullable_00431;

SELECT if(constant_false, then_non_constant_nullable, constant_null) AS res
FROM nullable_00431;

SELECT if(constant_false, then_non_constant_nullable, else_non_constant) AS res
FROM nullable_00431;

SELECT if(constant_false, then_non_constant_nullable, else_non_constant_nullable) AS res
FROM nullable_00431;

SELECT if(constant_null, then_constant, else_constant) AS res
FROM nullable_00431;

SELECT if(constant_null, then_constant, constant_null) AS res
FROM nullable_00431;

SELECT if(constant_null, then_constant, else_non_constant) AS res
FROM nullable_00431;

SELECT if(constant_null, then_constant, else_non_constant_nullable) AS res
FROM nullable_00431;

SELECT if(constant_null, constant_null, else_constant) AS res
FROM nullable_00431;

SELECT if(constant_null, constant_null, constant_null) AS res
FROM nullable_00431;

SELECT if(constant_null, constant_null, else_non_constant) AS res
FROM nullable_00431;

SELECT if(constant_null, constant_null, else_non_constant_nullable) AS res
FROM nullable_00431;

SELECT if(constant_null, then_non_constant, else_constant) AS res
FROM nullable_00431;

SELECT if(constant_null, then_non_constant, constant_null) AS res
FROM nullable_00431;

SELECT if(constant_null, then_non_constant, else_non_constant) AS res
FROM nullable_00431;

SELECT if(constant_null, then_non_constant, else_non_constant_nullable) AS res
FROM nullable_00431;

SELECT if(constant_null, then_non_constant_nullable, else_constant) AS res
FROM nullable_00431;

SELECT if(constant_null, then_non_constant_nullable, constant_null) AS res
FROM nullable_00431;

SELECT if(constant_null, then_non_constant_nullable, else_non_constant) AS res
FROM nullable_00431;

SELECT if(constant_null, then_non_constant_nullable, else_non_constant_nullable) AS res
FROM nullable_00431;

SELECT if(cond_non_constant, then_constant, else_constant) AS res
FROM nullable_00431;

SELECT if(cond_non_constant, then_constant, constant_null) AS res
FROM nullable_00431;

SELECT if(cond_non_constant, then_constant, else_non_constant) AS res
FROM nullable_00431;

SELECT if(cond_non_constant, then_constant, else_non_constant_nullable) AS res
FROM nullable_00431;

SELECT if(cond_non_constant, constant_null, else_constant) AS res
FROM nullable_00431;

SELECT if(cond_non_constant, constant_null, constant_null) AS res
FROM nullable_00431;

SELECT if(cond_non_constant, constant_null, else_non_constant) AS res
FROM nullable_00431;

SELECT if(cond_non_constant, constant_null, else_non_constant_nullable) AS res
FROM nullable_00431;

SELECT if(cond_non_constant, then_non_constant, else_constant) AS res
FROM nullable_00431;

SELECT if(cond_non_constant, then_non_constant, constant_null) AS res
FROM nullable_00431;

SELECT if(cond_non_constant, then_non_constant, else_non_constant) AS res
FROM nullable_00431;

SELECT if(cond_non_constant, then_non_constant, else_non_constant_nullable) AS res
FROM nullable_00431;

SELECT if(cond_non_constant, then_non_constant_nullable, else_constant) AS res
FROM nullable_00431;

SELECT if(cond_non_constant, then_non_constant_nullable, constant_null) AS res
FROM nullable_00431;

SELECT if(cond_non_constant, then_non_constant_nullable, else_non_constant) AS res
FROM nullable_00431;

SELECT if(cond_non_constant, then_non_constant_nullable, else_non_constant_nullable) AS res
FROM nullable_00431;

SELECT if(cond_non_constant_nullable, then_constant, else_constant) AS res
FROM nullable_00431;

SELECT if(cond_non_constant_nullable, then_constant, constant_null) AS res
FROM nullable_00431;

SELECT if(cond_non_constant_nullable, then_constant, else_non_constant) AS res
FROM nullable_00431;

SELECT if(cond_non_constant_nullable, then_constant, else_non_constant_nullable) AS res
FROM nullable_00431;

SELECT if(cond_non_constant_nullable, constant_null, else_constant) AS res
FROM nullable_00431;

SELECT if(cond_non_constant_nullable, constant_null, constant_null) AS res
FROM nullable_00431;

SELECT if(cond_non_constant_nullable, constant_null, else_non_constant) AS res
FROM nullable_00431;

SELECT if(cond_non_constant_nullable, constant_null, else_non_constant_nullable) AS res
FROM nullable_00431;

SELECT if(cond_non_constant_nullable, then_non_constant, else_constant) AS res
FROM nullable_00431;

SELECT if(cond_non_constant_nullable, then_non_constant, constant_null) AS res
FROM nullable_00431;

SELECT if(cond_non_constant_nullable, then_non_constant, else_non_constant) AS res
FROM nullable_00431;

SELECT if(cond_non_constant_nullable, then_non_constant, else_non_constant_nullable) AS res
FROM nullable_00431;

SELECT if(cond_non_constant_nullable, then_non_constant_nullable, else_constant) AS res
FROM nullable_00431;

SELECT if(cond_non_constant_nullable, then_non_constant_nullable, constant_null) AS res
FROM nullable_00431;

SELECT if(cond_non_constant_nullable, then_non_constant_nullable, else_non_constant) AS res
FROM nullable_00431;

SELECT if(cond_non_constant_nullable, then_non_constant_nullable, else_non_constant_nullable) AS res
FROM nullable_00431;