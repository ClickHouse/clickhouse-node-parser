SELECT divide(sum(a) + sum(b), nullIf(sum(c) + sum(d), 0)) FROM foo;
