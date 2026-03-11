select count()
     from a1 a
      join a1 b on (a.ANIMAL = b.ANIMAL)
      join a1 c on (c.ANIMAL = b.ANIMAL)
where a.ANIMAL = 'CROCO';
select count()
     from a1 a
     join a1 b on (a.ANIMAL = b.ANIMAL)
     join a1 c on (c.ANIMAL = b.ANIMAL)
prewhere a.ANIMAL = 'CROCO';
