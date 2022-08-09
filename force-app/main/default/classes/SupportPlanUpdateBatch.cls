public class SupportPlanUpdateBatch implements Database.Batchable<sObject>,Database.stateful{

    public Integer count=0;
    
    //Start
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([Select ID, Support_Plan__c, Account.CustomerPriority__c from Case where Support_Plan__c = NULL AND Account.CustomerPriority__c != NULL]);        
    }
    
    public void execute(Database.BatchableContext bc, List<Case> records){
        List<Case> caseToUpdate = new List<case>();
        for(Case cs : records){            
                if(cs.Account.CustomerPriority__c == 'High'){
                    cs.Support_Plan__c = 'Premium';
                }else if(cs.Account.CustomerPriority__c == 'Medium'){
                    cs.Support_Plan__c = 'Standard';
                }else if(cs.Account.CustomerPriority__c == 'Low'){
                    cs.Support_Plan__c = 'Basic';
                }
                count++;
                caseToUpdate.add(cs);        	
    	}
        if(!caseToUpdate.isEmpty()){
            update caseToUpdate;
        }
    }
    
    //finish
    public void finish(Database.BatchableContext bc){
        AsyncApexJob asyncJob = [SELECT Id, Status, ApexClass.Name FROM AsyncApexJob WHERE Id =:bc.getJobId() LIMIT 1];
        Application_Log__c log = new Application_Log__c();
        if(asyncJob.Status == 'Completed'){            
            log.Status__c = 'Success';
            log.Target_Type__c = 'Batch';
            log.Target_Name__c = asyncJob.ApexClass.Name;
            log.Message__c = count+' Records have been updated with the right support plan';            
        }else{
            log.Status__c = 'Error';
            log.Target_Type__c = 'Batch';
            log.Target_Name__c = asyncJob.ApexClass.Name;
            log.Message__c = 'Batch not completed successfully';  
        }
        insert log;
        
    }
}