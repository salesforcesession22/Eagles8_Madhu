@isTest
public class SupportPlanUpdateSchedulerTest {
    
    @isTest
    public static void batchSchedulerTest(){
        List<Case> caseList = TestDataFactory.createCaseAccts(10,10);
        
        test.startTest();        
        Database.executeBatch(new SupportPlanUpdateBatch());
     		String cronExp = '0 0 22 1/1 * ? *';
        	system.schedule('TestScheduler', cronExp, new SupportPlanUpdateScheduler());
        test.stopTest();
        
        //Validation Case Support Plan updated
        List<Case> caseUpdated = [Select ID,Support_Plan__c,Account.CustomerPriority__c from Case];
       
        for(Case cs : caseUpdated){
            if(cs.Account.CustomerPriority__c == 'High'){
                system.assertEquals('Premium', cs.Support_Plan__c);
            }else if(cs.Account.CustomerPriority__c == 'Medium'){
                system.assertEquals('Standard', cs.Support_Plan__c);
            }else if(cs.Account.CustomerPriority__c == 'Low'){
                system.assertEquals('Basic', cs.Support_Plan__c);
            }
        }     
        
        //Validation Log object inserted
        List<Application_Log__c> log = [Select Status__c from Application_Log__c];
        system.assert(log.size() == 1);
        system.assert(log.get(0).Status__c != NULL);
        
        //Validation Scheduler
        List<AsyncApexJob> jobsScheduled = [select Id, ApexClass.Name, Status, JobType from AsyncApexJob where JobType = 'ScheduledApex'];
        system.assert(jobsScheduled.size() == 1);
        system.assertEquals('SupportPlanUpdateScheduler', jobsScheduled.get(0).ApexClass.Name);

        
    }

}