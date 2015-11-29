<?php

class Config {
	const DB_DSN = 'mysql:host=localhost;dbname=XXX';
	const DB_USER = 'XXX';
	const DB_PASSWORD = 'XXX';
	const TESTNODE_TOKEN = 'xxx';
	public static $rootPath;
	const RESULTS_PATH = 'ui/results/';
	const MAIL_HOST = 'localhost';
	const MAIL_PORT = 25;
	const MAIL_USER = null;
	const MAIL_PASSWORD = null;
	const MAIL_SENDER_NAME = 'AWT Reporter';
	const MAIL_SENDER_EMAIL = 'dev@null.com';
	const MAIL_TEMPLATE_PATH = 'mail/';
	const UI_URL = 'https://advancedwebtesting.com/ui/';
	const UI_PATH = 'ui/';
	const SIGNUP_BONUS = 100;
	const PAYPAL_USER = 'XX';
	const PAYPAL_PASSWORD = 'XXXX';
	const PAYPAL_SIGNATURE = 'XXXXX';
	const PAYPAL_SANDBOX = true;
	const WEBMONEY_ID = '000000000000';
	const WEBMONEY_PURSE = 'R000000000000';
	const WEBMONEY_CERT = '/xxx/xxxxxxxx.crt';
	const WEBMONEY_CERT_KEY = '/xxx/xxxxxxxx.key';
	const WEBMONEY_SECRET_KEY = 'XXXXXXXXXXXXXXXXXXXXXX';
	const WEBMONEY_DAY_LIMIT = 0;
	const WEBMONEY_WEEK_LIMIT = 0;
	const WEBMONEY_MONTH_LIMIT = 0;
	const TASK_TIMEOUT = 600; // seconds
	const TASK_ACTION_TIMEOUT = 10; // seconds
	const TEST_MAX_ACTIONS_CNT = 60;
	const PURGE_PERIOD = 42; // days
	const BILLING_PURGE_PERIOD = 732; // days
	const BILLING_PENDING_PURGE_PERIOD = 1; // days
}

\Config::$rootPath = __DIR__ . '/';
