SELECT if(in(dummy, tuple(0, 1)), 'ok', 'ok')
FROM remote('localhost', `system`.one);