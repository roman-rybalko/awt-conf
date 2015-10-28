
var spawncb = require('./lib/spawncb');

module.exports = {
	server_url: 'https://advancedwebtesting.com/si/task.php',
	server_token: 'iuB7lPg9Q3jSc9B95BFKRnkWkixmV3I1qQIuenRhsR',
	task_type: 'ff_480x800',
	node_id: 'n5-c6',
	selenium_browser: 'firefox',
	selenium_server: 'http://localhost:4416/wd/hub',
	selenium_port: 4416,
	selenium_timeout: 30000,  // msec
	selenium_fullscreen: false,
	batch_count: 1,  // a starving bug somewhere prevents efficient parallel run
	batch_timeout: 5000,  // msec
	batch_start_cb: spawncb('../init.sh'),
	batch_finish_cb: spawncb('../cleanup.sh'),
	xdisplay: 16,
	xauth: "/tmp/xauth16",
	xscrsize: "480x800x24"
};
