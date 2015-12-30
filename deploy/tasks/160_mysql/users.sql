create user 'awt'@'localhost' identified by 'V0TrpouKDUxUIzb1yubNBW';
grant all on awt.* to 'awt'@'localhost';

create user 'awt-bak'@'localhost' identified by '9z4NC5cUD68XM7EYHrgKjF';
grant REPLICATION CLIENT, reload on *.* to 'awt-bak'@'localhost';
grant select on awt.* to 'awt-bak'@'localhost';

create user 'awt-repl'@'%.hosts.advancedwebtesting.net' identified by '7tGN73iGO8yFBCQ3rz2RED';
grant REPLICATION SLAVE on *.* to 'awt-repl'@'%.hosts.advancedwebtesting.net';

create user 'awt-repl-adm'@'localhost' identified by 'ubEBbVnoy0cCOiW876hNgd';
grant super, reload on *.* to 'awt-repl-adm'@'localhost';
grant drop, create, insert on awt.* to 'awt-repl-adm'@'localhost';
