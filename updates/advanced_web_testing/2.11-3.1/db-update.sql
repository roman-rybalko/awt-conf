alter table stats change task_actions_executed actions_executed integer not null default 0;
alter table stats add tasks_added integer not null default 0;
