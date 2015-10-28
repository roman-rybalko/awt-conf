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
}

\Config::$rootPath = __DIR__ . '/';
