#!/bin/sh -ex
. ./remote.conf

cat /var/www/awt/config.*.php
diff -u /var/www/awt/config.sample.php config.sample.php || true
diff -u /var/www/awt/config.local.php config.local.php || true

chmod -v a-wx,o-r,g+r config.*.php
chgrp -v www-data config.*.php

mv -vf config.local.php config.sample.php /var/www/awt/
