select if(in(dummy, tuple(0, 1)), 'ok', 'ok') from remote('localhost', system.one);
