select length(name), name, '.' from system.users where position(name, ' ')!=0 order by name;
