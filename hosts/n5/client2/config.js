"use strict";

var spawncb = require('./lib/spawncb');
var scrn = require('./lib/scrot').get_scrn;
//var scrn = require('./lib/selutil').get_scrn;

module.exports = {
	server_url: 'https://advancedwebtesting.com/si/task.php',
	server_token: 'iuB7lPg9Q3jSc9B95BFKRnkWkixmV3I1qQIuenRhsR',
	task_type: 'ff_1920x1080',
	node_id: 'n5-c2',
	//selenium_start_cb: spawncb('printf', ['selenium_start_cb called\n']),  /// fn(task) | null
	//selenium_finish_cb: spawncb('true'),  /// fn(task, fails, scrns) | null
	//selenium_finish_cb: spawncb('printf', ['selenium_finish_cb called\n']),  /// fn(task, fails, scrns) | null
	//selenium_capabilities: {'phantomjs.cli.args': ['--webdriver-logfile=../selenium.log']},  /// {name: value} | null
	//selenium_browser: 'chrome',  /// string | null
	selenium_browser: 'firefox',  /// string | null
	//selenium_browser: 'phantomjs',  /// string | null
	//selenium_browser: 'internet explorer',  /// string | null
	//selenium_server: 'http://localhost:4412/wd/hub',  /// url | null
	//selenium_server: 'http://localhost:5512/',  /// url | null
	//selenium_port: 4412,  /// integer 1024-65535 | null
	selenium_timeout: 30000,  /// msec
	selenium_fullscreen: false,
	selenium_scrn: scrn,  /// fn(selenium)
	batch_count: 1,  /// a starving bug somewhere prevents efficient parallel run
	batch_timeout: 5000,  /// msec
	//batch_start_cb: spawncb('printf', ['batch_start_cb called\n']),  /// fn() | null
	batch_start_cb: spawncb('../init.sh'),
	//batch_finish_cb: spawncb('true'),  /// fn(err, val) | null
	//batch_finish_cb: spawncb('printf', ['batch_finish_cb called\n']),  /// fn(err, val) | null
	batch_finish_cb: spawncb('../cleanup.sh'),
	x_display: 12,  /// integer | null
	x_auth: "/tmp/xauth12",  /// integer | null
	x_scrsize: "1920x1080x24",  /// integer | null
};
