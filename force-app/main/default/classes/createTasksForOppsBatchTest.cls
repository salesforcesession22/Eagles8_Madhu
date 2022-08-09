@isTest
public with sharing class createTasksForOppsBatchTest {
    

    @isTest 
    public static void testMethod1(){
        List<Opportunity> oppList = TestDataFactory.createOpps(100);
        Test.startTest();
            Database.executeBatch(new createTasksForOppsBatch(), 100);
            createTasksForOppsBatchScheduler schOpps = new createTasksForOppsBatchScheduler();
            String cron = '0 0 1 ? * MON *'; 
            System.schedule('createTasksForOppsBatchScheduler', cron, schOpps);
        Test.stopTest();
        //Validation 
        List<Task> taskList = [Select ActivityDate,WhatId from Task where WhatId IN:oppList];
        system.assert(taskList.size() == 100);
        for(Task tsk : taskList){
            system.assertEquals(system.today() +12, tsk.ActivityDate);
        }
        List<AsyncApexJob> jobsScheduled = [select Id, ApexClass.Name, Status, JobType from AsyncApexJob where JobType = 'ScheduledApex'];
        System.assertEquals(1, jobsScheduled.size());
        system.assertEquals('createTasksForOppsBatchScheduler', jobsScheduled.get(0).ApexClass.Name);

    
    }

}