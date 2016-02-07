create table test_groups(user_id integer not null, test_group_id integer primary key auto_increment not null, name varbinary(256), deleted integer(1), time integer not null);
create index test_groups_idx1 on test_groups(user_id);
create index test_groups_idx2 on test_groups(deleted, time);
create table tg_tests(test_group_id integer not null, test_id integer not null, test_name varbinary(256) not null, task_type varbinary(256) not null, tg_test_id integer primary key auto_increment not null);
create index tg_tests_idx on tg_tests(test_group_id);
