drop index task_types_idx on task_types;
create index task_types_idx on task_types(name(32));
