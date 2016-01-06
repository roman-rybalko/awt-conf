create user 'awt'@'localhost' identified by 'V0TrpouKDUxUIzb1yubNBW';
grant all on awt.* to 'awt'@'localhost';

create user 'awt-bak'@'localhost' identified by '9z4NC5cUD68XM7EYHrgKjF';
grant REPLICATION CLIENT, RELOAD on *.* to 'awt-bak'@'localhost';
grant SELECT on awt.* to 'awt-bak'@'localhost';

create user 'awt-repl'@'%.hosts.advancedwebtesting.net' identified by '7tGN73iGO8yFBCQ3rz2RED';
grant REPLICATION SLAVE on *.* to 'awt-repl'@'%.hosts.advancedwebtesting.net';

create user 'awt-repl-adm'@'localhost' identified by 'ubEBbVnoy0cCOiW876hNgd';
grant SUPER, RELOAD on *.* to 'awt-repl-adm'@'localhost';
grant DROP, CREATE, INSERT on awt.* to 'awt-repl-adm'@'localhost';

create user 'munin'@'localhost' identified by 'NBS2UpsgfXzqagwIMBQKKZ';
grant PROCESS, SUPER, REPLICATION CLIENT on *.* to 'munin'@'localhost';
