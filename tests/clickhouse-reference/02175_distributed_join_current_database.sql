
select * from dist_02175 l join local_02175 r using dummy;
select * from dist_02175 l global join local_02175 r using dummy;
-- explicit database for distributed table
select * from remote('127.1', currentDatabase(), dist_02175) l join local_02175 r using dummy;
select * from remote('127.1', currentDatabase(), dist_02175) l global join local_02175 r using dummy;
