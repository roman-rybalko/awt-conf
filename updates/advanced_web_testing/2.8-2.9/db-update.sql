create table webmoney_transactions(id integer primary key not null auto_increment, time integer not null, user_id integer, external_id integer, url varchar(256), subscription varchar(256), actions_cnt integer not null, payment_data varchar(256), wmid varchar(16), purse varchar(16), purse_id integer, started int(1));
create index webmoney_transactions_idx1 on webmoney_transactions(user_id);
create index webmoney_transactions_idx2 on webmoney_transactions(external_id);  -- not unique, external_id may be null
create table webmoney_subscriptions(id integer primary key not null auto_increment, time integer not null, user_id integer, actions_cnt integer not null, wmid varchar(16), purse varchar(16));
create index webmoney_subscriptions_idx on webmoney_subscriptions(user_id);
