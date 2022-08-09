@isTest
public class SalesforceTicketTriggerHandlerTest{

   /* @testSetup
    public static void testSetup(){
        Integer i,j;
        //Create 100 Projects
        List<Salesforce_Project__c> projList = new List<Salesforce_Project__c>();
        for(i=0; i<100; i++){
            Salesforce_Project__c proj = new Salesforce_Project__c();
            proj.Project_Name__c = 'TestProject'+i;
            proj.Status__c = 'New';
            projList.add(proj);
        }
        insert projList;
        //Create 100 Tickets
        List<Salesforce_Ticket__c> tickList = new List<Salesforce_Ticket__c>();
        for(i=0;i<100;i++){            
                Salesforce_Ticket__c tck = new Salesforce_Ticket__c();
                tck.Subject__c = 'TestTicket'+i;
                tck.Salesforce_Project__c = projList.get(i).id;
                tck.Status__c = 'New';
                tickList.add(tck);            
        }
        insert tickList;
    } */
    
    @isTest
    public static void projMarkCompleteTest(){
        List<Salesforce_Project__c> projList = TestDataFactory.createProjTckts(5,5);
        List<Salesforce_Ticket__c> tickList = [Select Status__c,Salesforce_Project__c from Salesforce_Ticket__c where Salesforce_Project__c IN:projList];
        for(Salesforce_Ticket__c tckt : tickList){
            tckt.Status__c = 'Completed';
        }
        update tickList;
        Test.startTest();
            List<Salesforce_Project__c> projListUpdate = [Select Status__c from Salesforce_Project__c];
            for(Salesforce_Project__c proj : projListUpdate){
                system.assertEquals('Completed', proj.Status__c);
            }
        Test.stoptest();
    }
}