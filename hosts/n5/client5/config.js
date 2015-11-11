"use strict";

var spawncb = require('./lib/spawncb');
var killchtreecb = require('./lib/killchtreecb');
var scrn = require('./lib/scrot').get_scrn;
//var scrn = require('./lib/selutil').get_scrn;

module.exports = {
	server_url: 'https://advancedwebtesting.com/si/task.php',
	server_token: 'iuB7lPg9Q3jSc9B95BFKRnkWkixmV3I1qQIuenRhsR',
	task_type: 'gc_iphone_portrait',
	node_id: 'n5-c5',
	//selenium_start_cb: spawncb('printf', ['selenium_start_cb called\n']),  /// fn(task) | null
	//selenium_finish_cb: spawncb('printf', ['selenium_finish_cb called\n']),  /// fn(task, fails, scrns) | null
	//selenium_capabilities: {'phantomjs.cli.args': ['--webdriver-logfile=/tmp/selenium.log']},  /// {name: value} | null
	selenium_capabilities: {chromeOptions: {mobileEmulation: {deviceName: 'Apple iPhone 6'}}},  /// {name: value} | null
	//selenium_capabilities: {chromeOptions: {mobileEmulation: {userAgent: 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', deviceMetrics: {width: 667, height: 375, pixelRatio: 2}}}},  /// {name: value} | null
	//selenium_capabilities: {chromeOptions: {mobileEmulation: {userAgent: 'Mozilla/5.0 (iPad; CPU OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53', deviceMetrics: {width: 1024, height: 768, pixelRatio: 2}}}},  /// {name: value} | null
	//selenium_capabilities: {chromeOptions: {mobileEmulation: {userAgent: 'Mozilla/5.0 (Linux; Android 5.1.1; Nexus 6 Build/LYZ28E) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.20 Mobile Safari/537.36', deviceMetrics: {width: 690, height: 387, pixelRatio: 3.5}}}},  /// {name: value} | null
	selenium_browser: 'chrome',  /// string | null
	//selenium_browser: 'firefox',  /// string | null
	//selenium_browser: 'phantomjs',  /// string | null
	//selenium_browser: 'internet explorer',  /// string | null
	//selenium_server: 'http://localhost:4415/wd/hub',  /// url | null
	//selenium_server: 'http://localhost:5515/',  /// url | null
	//selenium_port: 4415,  /// integer 1024-65535 | null
	selenium_timeout: 10000,  /// msec
	selenium_fullscreen: false,
	selenium_scrn: scrn,  /// fn(selenium)
	batch_count: 1,  /// a starving bug somewhere prevents efficient parallel run
	batch_timeout: 5000,  /// msec
	//batch_start_cb: spawncb('printf', ['batch_start_cb called\n']),  /// fn() | null
	batch_start_cb: spawncb('../init.sh'),  /// fn() | null
	//batch_finish_cb: spawncb('printf', ['batch_finish_cb called\n']),  /// fn(err, val) | null
	//batch_finish_cb: spawncb('../cleanup.sh'),  /// fn(err, val) | null
	batch_finish_cb: function() { killchtreecb(process.pid, 'SIGKILL')(); spawncb('../cleanup.sh')(); },  /// fn(err, val) | null
	x_display: 15,  /// integer | null
	x_auth: "/tmp/xauth15",  /// integer | null
	//x_scrsize: "1200x1024x24",  /// integer | null
	//x_scrsize: "1024x1200x24",  /// integer | null
	//x_scrsize: "800x480x24",  /// integer | null
	x_scrsize: "480x800x24",  /// integer | null
	//x_scrsize: "1024x768x24",  /// integer | null
	//x_scrsize: "1920x1080x24",  /// integer | null
};
