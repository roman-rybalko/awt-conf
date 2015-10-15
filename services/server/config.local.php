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
	const MAIL_USER = 'test@advancedwebtesting.com';
	const MAIL_PASSWORD = 'test12';
	const MAIL_SENDER_NAME = 'Advanced Web Testing';
	const MAIL_SENDER_EMAIL = 'test@advancedwebtesting.com';
	const MAIL_TEMPLATE_PATH = 'mail/';
	const UI_URL = 'https://advancedwebtesting.com/ui/';
	const UI_PATH = 'ui/';
	const REGISTRATION_TOP_UP = 100;
	const DEMO_PASSWORD = 'Vhh1GCBahBDeaWBDJE2Ll8b29azv4x2UP33BsQT9US';
}

\Config::$rootPath = __DIR__ . '/';

?>