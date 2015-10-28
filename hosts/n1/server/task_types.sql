INSERT INTO `task_types` (`type_id`, name, `parent_type_id`) VALUES(1, 'any', NULL);
INSERT INTO `task_types` (`type_id`, name, `parent_type_id`) VALUES(3, 'ff', 1);
INSERT INTO `task_types` (`type_id`, name, `parent_type_id`) VALUES(4, 'gc', 1);

INSERT INTO `task_types` (`type_id`, name, `parent_type_id`) VALUES(11, 'ff_800x480', 3);
INSERT INTO `task_types` (`type_id`, name, `parent_type_id`) VALUES(12, 'ff_480x800', 3);
INSERT INTO `task_types` (`type_id`, name, `parent_type_id`) VALUES(13, 'ff_1920x1080', 3);

INSERT INTO `task_types` (`type_id`, name, `parent_type_id`) VALUES(21, 'gc_800x480', 4);
INSERT INTO `task_types` (`type_id`, name, `parent_type_id`) VALUES(22, 'gc_480x800', 4);
INSERT INTO `task_types` (`type_id`, name, `parent_type_id`) VALUES(23, 'gc_1920x1080', 4);
