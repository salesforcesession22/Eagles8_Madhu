public class salesforceProjectBatch implements Database.Batchable<sObject>, Database.stateful{

/* Scenario - Update the Project Description, appending 'Updating from Batch' */ 
    
    public Set<ID> projInputIds = new Set<ID>();
    
	//Call from Trigger
    public salesforceProjectBatch (Set<ID> triNewMapProjIDs){
        this.projInputIds = triNewMapProjIDs;        
    }
    
    //Start
    public Database.QueryLocator start(Database.BatchableContext bc){
        String queryString = 'Select ID, Description__c from Salesforce_Project__c where ID IN : projInputIds';
        return Database.getQueryLocator(queryString);     
    }
    
    //Execute
    public void execute(Database.BatchableContext bc, List<Salesforce_Project__c> records){
      //1.Loop through the records
      //2.Update the description - existing description + 'Updating from Batch'
      //3.Update records      
      List<Salesforce_Project__c> projUpdateList = new List<Salesforce_Project__c>();
        for(Salesforce_Project__c proj : records){
            if(proj.Description__c == NULL){
                proj.Description__c = ' Updating from Batch';
            }else{
                proj.Description__c = proj.Description__c + ' Updating from Batch';
            }        

            projUpdateList.add(proj);
        }
      
        if(!projUpdateList.isEmpty()){
            update projUpdateList;
        }
        

    }
    
    //finish
    public void finish(Database.BatchableContext bc){
        system.debug('I am finished');
       
        
    }
    
    
}