delete from task_types;

INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(1, 'any', NULL);

INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(11, 'mobile', 1);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(12, 'desktop', 1);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(13, 'ff', 1);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(14, 'gc', 1);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(15, 'phantomjs', 1);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(16, 'o', 1);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(17, 'ie', 1);

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

INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(61, 'phantomjs_desktop', 12);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(62, 'phantomjs_mobile', 11);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(63, 'phantomjs_desktop', 15);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(64, 'phantomjs_mobile', 15);

INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(71, 'o_1920x1080', 31);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(72, 'o_1024x768', 32);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(73, 'o_1920x1080', 16);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(74, 'o_1024x768', 16);

INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(81, 'ie8', 12);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(82, 'ie11', 12);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(83, 'ie8', 17);
INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(84, 'ie11', 17);

INSERT INTO `task_types` (`type_id`, `name`, `parent_type_id`) VALUES(100, 'test', NULL);
