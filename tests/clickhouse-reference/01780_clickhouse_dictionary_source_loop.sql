SELECT * FROM dict1; --{serverError BAD_ARGUMENTS}
SELECT * FROM 01780_db.dict2; --{serverError BAD_ARGUMENTS}
SELECT * FROM 01780_db.dict3;
