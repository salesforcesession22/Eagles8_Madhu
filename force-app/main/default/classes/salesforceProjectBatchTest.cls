@isTest
public class salesforceProjectBatchTest{
    
    @isTest 
    public static void testMethod1(){
        List<Salesforce_Project__c> projList = TestDataFactory.createProjects(200);
        
        
            Test.startTest();
                salesforceProjectBatch sfBatch = new salesforceProjectBatch();    
                Id bacthIDValue = Database.executeBatch(sfBatch,200);
            test.stopTest();
        
        
        
        //Validation
        List<Salesforce_Project__c> projListNew = [Select Description__c from Salesforce_Project__c];
        for(Salesforce_Project__c proj : projListNew){
            system.assertEquals('Sample Updating from Batch', proj.Description__c);
        }
    }

}