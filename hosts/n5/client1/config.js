
var spawncb = require('./lib/spawncb');

module.exports = {
	server_url: 'https://advancedwebtesting.com/si/task.php',
	server_token: 'iuB7lPg9Q3jSc9B95BFKRnkWkixmV3I1qQIuenRhsR',
	task_type: 'gc_1920x1080',
	node_id: 'n5-c1',
	selenium_browser: 'chrome',
	selenium_server: 'http://localhost:4411/wd/hub',
	selenium_port: 4411,
	selenium_timeout: 30000,  // msec
	selenium_fullscreen: false,
	batch_count: 1,  // a starving bug somewhere prevents efficient parallel run
	batch_timeout: 5000,  // msec
	batch_start_cb: spawncb('../init.sh'),
	batch_finish_cb: spawncb('../cleanup.sh'),
	xdisplay: 11,
	xauth: "/tmp/xauth11",
	xscrsize: "1920x1080x24"
};
