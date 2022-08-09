@isTest
public class SFProject_FutureTriggerHandlerTest {
    
  
    
    @isTest
    public static void updateProjDescriptionTest(){
        /*List<Salesforce_Project__c> projList = TestDataFactory.createProjects(2);
        
        Set<ID> projIds = new Set<ID>();
        for(Salesforce_Project__c proj : projList){
            projIds.add(proj.id);
        }
        
        //Future - ANY Asynchronous call, Inside Test start/stop, why?
        // Ans - Inside Test start/Stop it runs in a separate context 
        Test.startTest();
        	 SFProject_FutureTriggerHandler.updateProjDescription(projIds);
        Test.stopTest();
        
        //Validation
        List<Salesforce_Project__c> projListUpdate = [Select Description__c from Salesforce_Project__c];
        for(Salesforce_Project__c proj : projListUpdate){
            //system.assert(proj.Description__c.contains('Updated from Future'));
            system.assertEquals('Sample Updated from Future', proj.Description__c);
        }*/
        
        //On creation the method will be called
        Test.startTest();
        	 List<Salesforce_Project__c> projList = TestDataFactory.createProjects(10);
        Test.stopTest();
        //Validation
        List<Salesforce_Project__c> projListUpdate = [Select Description__c from Salesforce_Project__c];
        for(Salesforce_Project__c proj : projListUpdate){            
            system.assertEquals('Sample Updated from Future', proj.Description__c);
        }
       
    }     
    
    @isTest
    public static void futureupdateTicketsTest(){        
      List<Salesforce_Project__c> projList = TestDataFactory.createProjTckts(5,5);
        Test.startTest();
            for(Salesforce_Project__c proj : projList){
                proj.Status__c = 'Completed';
            }
            update projList; // Trigger will be fired
        Test.stoptest();
        
        //Validation
        List<Salesforce_Ticket__c> tickList = [Select id, Status__c, Salesforce_Project__c from Salesforce_Ticket__c
                                           where Salesforce_Project__c IN : projList];
        for(Salesforce_Ticket__c tckt : tickList){
            system.debug('After'+tckt.Status__c);
            system.assertEquals('Completed', tckt.Status__c);
        }
    }

}