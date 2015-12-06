<?php

class Config {
	const DB_DSN = 'mysql:host=localhost;dbname=awt';
	const DB_USER = 'awt';
	const DB_PASSWORD = 'V0TrpouKDUxUIzb1yubNBW';
	const TESTNODE_TOKEN = 'iuB7lPg9Q3jSc9B95BFKRnkWkixmV3I1qQIuenRhsR';
	public static $rootPath;
	const RESULTS_PATH = 'ui/results/';
	const MAIL_HOST = 'smtp.yandex.ru';
	const MAIL_PORT = 587;
	const MAIL_USER = 'report@advancedwebtesting.com';
	const MAIL_PASSWORD = 'XvkyGirv3DF5';
	const MAIL_SENDER_NAME = 'Advanced Web Testing';
	const MAIL_SENDER_EMAIL = 'report@advancedwebtesting.com';
	const MAIL_TEMPLATE_PATH = 'mail/';
	const UI_URL = 'https://advancedwebtesting.com/ui/';
	const UI_PATH = 'ui/';
	const SIGNUP_BONUS = 200;
	const PAYPAL_USER = 'paypal_api1.advancedwebtesting.com';
	const PAYPAL_PASSWORD = 'NXN3A2C2DDFU9M4V';
	const PAYPAL_SIGNATURE = 'AN4Wox6XAN2kmJLCRapsav7rwlB6Agsvbs67aQHco9tp3MSBDvf-9LJI';
	const PAYPAL_SANDBOX = false;
	const WEBMONEY_ID = '952332683666';
	const WEBMONEY_PURSE = 'R264591009121';
	const WEBMONEY_CERT = '/var/www/awt/webmoney-952332683666.crt';
	const WEBMONEY_CERT_KEY = '/var/www/awt/webmoney-952332683666.key';
	const WEBMONEY_SECRET_KEY = 'HXmxVVDTrdZtDuV3xbsqo9';
	const WEBMONEY_DAY_LIMIT = 1000;
	const WEBMONEY_WEEK_LIMIT = 7000;
	const WEBMONEY_MONTH_LIMIT = 14000;
	const TASK_TIMEOUT = 600;  // seconds
	const TASK_ACTION_TIMEOUT = 10;  // seconds
	const TEST_MAX_ACTIONS_CNT = 42;
	const PURGE_PERIOD = 42;  // days
	const BILLING_PURGE_PERIOD = 732;  // days
	const BILLING_PENDING_PURGE_PERIOD = 1;  // days
	public static $proxy = [
		'us' => 'proxy-us.hosts.advancedwebtesting.net:64312',
		'eu' => 'proxy-eu.hosts.advancedwebtesting.net:64312',
		'ru' => 'proxy-ru.hosts.advancedwebtesting.net:64312',
		'cn' => 'proxy-cn.hosts.advancedwebtesting.net:64312',
		'default' => 'proxy-default.hosts.advancedwebtesting.net:64312',
		'custom' => ''
	];
}

\Config::$rootPath = __DIR__ . '/';
