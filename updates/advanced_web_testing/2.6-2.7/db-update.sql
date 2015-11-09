drop index billing_transactions_idx on billing_transactions; -- (time, user_key);
create index billing_transactions_idx1 on billing_transactions(user_key, time);
create index billing_transactions_idx2 on billing_transactions(time);

drop index history_idx1 on history; -- (user_key);
create index history_idx1 on history(user_key, time);

drop index tasks_idx2 on tasks; -- (user_id);
create index tasks_idx2 on tasks(user_id, time);
create index tasks_idx3 on tasks(time);

drop index stats_idx on stats; -- unique (user_id, time);
create unique index stats_idx1 on stats(user_id, time);
create index stats_idx2 on stats(time);

create index tests_idx1 on tests(user_id);
create index tests_idx2 on tests(deleted, time);
