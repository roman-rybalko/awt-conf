alter table tasks modify status integer;
drop index tasks_idx on tasks;
create index tasks_idx1 on tasks(status);
create index tasks_idx2 on tasks(user_id);
