
salesforceProjectBatchScheduler schProj = new salesforceProjectBatchScheduler();
String cron = '0 30 22 * * ? *'; // 10.30PM
system.schedule('SFProjectBatchScheduler', cron, schProj);