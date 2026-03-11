SELECT *
FROM file(`02453_data`.jsonl, auto, 'x UInt32')
SETTINGS
    input_format_allow_errors_num = 1,
    input_format_record_errors_file_path = '../error_file';