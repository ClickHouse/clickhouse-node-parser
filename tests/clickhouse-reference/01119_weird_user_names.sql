create user "       ";
create user '   spaces';
create user 'spaces    ';
create user ` INTERSERVER SECRET `;  -- { serverError BAD_ARGUMENTS }
create user 'test 01119';
create user "Вася Пупкин";
create user "无名氏 ";
create user "🙈 🙉 🙊";
select length(name), name, '.' from system.users where position(name, ' ')!=0 order by name;
