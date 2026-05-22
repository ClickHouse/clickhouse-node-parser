SELECT '--------------------';
SELECT * from executable('JSON', 'data String', SETTINGS max_command_execution_time=100); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
SELECT * from executable('JSON', 'data String', 'TEST', 'TEST'); -- { serverError BAD_ARGUMENTS }
