<?php

class Config {
	const DB_DSN = 'mysql:host=localhost;dbname=awt';
	const DB_USER = 'awt';
	const DB_PASSWORD = 'awt';
	const TESTNODE_TOKEN = 'EtZGlOGWMGtEOptUcaQN98KTnPrXpvXgpY1orOue04';
	public static $rootPath;
	const RESULTS_PATH = 'ui/results/';
	const MAIL_HOST = 'smtp.yandex.ru';
	const MAIL_PORT = 587;
	const MAIL_USER = 'test@advancedwebtesting.com';
	const MAIL_PASSWORD = 'test12';
	const MAIL_SENDER_NAME = 'Advanced Web Testing';
	const MAIL_SENDER_EMAIL = 'test@advancedwebtesting.com';
	const MAIL_TEMPLATE_PATH = 'mail/';
	const UI_URL = 'http://www/awt/server/ui/';
	const UI_PATH = 'ui/';
	const SIGNUP_BONUS = 1000;
	const PAYPAL_USER = 'paypal-dev-biz1_api1.romanr.info';
	const PAYPAL_PASSWORD = 'EVZ94D6J4D79666B';
	const PAYPAL_SIGNATURE = 'AFcWxV21C7fd0v3bYYYRCpSSRl31A4mKpRLpIJARBcgYnwfQqUCoZFC3';
	const PAYPAL_SANDBOX = true;
	const WEBMONEY_ID = '952332683666';
	const WEBMONEY_PURSE = 'Z378989169843';
	const WEBMONEY_CERT = '/var/tmp/wm.crt';
	const WEBMONEY_CERT_KEY = '/var/tmp/wm.key';
	const WEBMONEY_SECRET_KEY = 'HXmxVVDTrdZtDuV3xbsqo9';
	const WEBMONEY_DAY_LIMIT = 100;
	const WEBMONEY_WEEK_LIMIT = 700;
	const WEBMONEY_MONTH_LIMIT = 1400;
	const TASK_TIMEOUT = 120; // seconds
	const TASK_ACTION_TIMEOUT = 10; // seconds
	const TEST_MAX_ACTIONS_CNT = 100;
	const PURGE_PERIOD = 42; // days
	const BILLING_PURGE_PERIOD = 732; // days
	const BILLING_PENDING_PURGE_PERIOD = 1; // days
	public static $proxy = [
		'us' => 'localhost:13128',
		'eu' => 'localhost:23128',
		'ru' => 'http://www.dev/pac/proxy-ru.js',
		'cn' => 'http://www.dev/pac/proxy-cn.js',
		'default' => 'localhost:3128',
		'custom' => ''
	];
}

\Config::$rootPath = __DIR__ . '/';
date_default_timezone_set('UTC');
