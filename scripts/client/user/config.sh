NODE_ID=`nodejs getconf.js node_id`
TASK_TYPE=`nodejs getconf.js task_type`
X_FILE=`nodejs getconf.js xauth`
SEL_ADDR=`nodejs getconf.js selenium_server`
SEL_HOME=/tmp/$USER-$NODE_ID-$TASK_TYPE
