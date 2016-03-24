alter table settings add task_fail_emails varbinary(1024) after task_success_email_report;
alter table settings add task_success_emails varbinary(1024) after task_fail_emails;
