awt 3.1 update
--------------

1. iptables -A INPUT -p tcp --dport 443 -j DROP -m comment --comment 'awt 3.1 update'
2. crontab -u www-data -e
3. mysql import db-update
4. deploy batch/server
5. stats_update.php
6. crontab -u www-data -e
7. iptables -D INPUT -p tcp --dport 443 -j DROP -m comment --comment 'awt 3.1 update'
8. rmmod iptables*
