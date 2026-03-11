select sum(sleep(0.1)) from tab settings max_block_size = 1, max_execution_time=1; -- { serverError TIMEOUT_EXCEEDED }
