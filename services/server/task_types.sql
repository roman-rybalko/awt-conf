INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(1, 'any', NULL);

INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(11, 'mobile', 1);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(12, 'desktop', 1);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(13, 'ff', 1);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(14, 'gc', 1);

INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(21, 'mobile_landscape', 11);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(22, 'mobile_portrait', 11);

INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(31, 'desktop_large', 12);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(32, 'desktop_small', 12);

INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(41, 'ff_1920x1080', 31);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(42, 'ff_1024x768', 32);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(43, 'ff_1920x1080', 13);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(44, 'ff_1024x768', 13);

INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(51, 'gc_1920x1080', 31);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(52, 'gc_iphone_portrait', 22);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(53, 'gc_iphone_landscape', 21);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(54, 'gc_android_landscape', 21);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(55, 'gc_1920x1080', 14);

INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(100, 'test', NULL);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(101, 'phantomjs', 100);
