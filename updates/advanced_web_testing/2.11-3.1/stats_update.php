<?php
require_once '../web_construction_set/autoload.php';
$db = new \WebConstructionSet\Database\Relational\Pdo(\Config::DB_DSN, \Config::DB_USER, \Config::DB_PASSWORD);
$userDb = new \WebConstructionSet\Database\Relational\User($db);
$users = $userDb->get();
foreach ($users as $user) {
	$userId = $user['id'];
	$statMgr = new \AdvancedWebTesting\Stats\Manager($db, $userId);
	$statMgr->clear(time());
	$taskMgr = new \AdvancedWebTesting\Task\Manager($db, $userId);
	$tasks = $taskMgr->get();
	$progress = 0;
	foreach ($tasks as $task) {
		$taskId = $task['id'];
		$taskActMgr = new \AdvancedWebTesting\Task\Action\Manager($db, $taskId);
		$actions = $taskActMgr->get();
		$actExecCnt = 0;
		foreach ($actions as $action)
			if ($action['failed'] || $action['succeeded'])
				++$actExecCnt;
		$statMgr->add(1, $task['status'] == \AdvancedWebTesting\Task\Status::FAILED ? 1 : $task['status'] == \AdvancedWebTesting\Task\Status::SUCCEEDED ? 1 : 0,
			$task['status'] == \AdvancedWebTesting\Task\Status::FAILED ? 1 : 0,
			$actExecCnt,
			$task['time']);
		echo ++$progress, '/', count($tasks), "\r";
	}
	echo 'user ', $user['login'], ' processed', "\n";
}
