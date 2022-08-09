public with sharing class SalesforceTicketTriggerHandler {
    public static void projMarkComplete(List<Salesforce_Ticket__c> tcktTriNew){
        //Seggregate the Ids marked as complete
        Set<ID> projIDS = new Set<ID>();

        for(Salesforce_Ticket__c tckt : tcktTriNew){
            if(tckt.Status__c == 'Completed'){                
                projIDS.add(tckt.Salesforce_Project__c);
            }
        }
      
        //SOQL for checking Child tickets
        List<Salesforce_Project__c> projWithClosedTckts = [Select ID,Status__c,(Select ID, Status__c FROM Salesforce_Tickets__r 
                                                           where Status__c != 'Completed' AND Status__c !='Cancelled') 
                                                           FROM Salesforce_Project__c where ID IN :projIDS];

        if(!projWithClosedTckts.isEmpty()){
            for(Salesforce_Project__c proj : projWithClosedTckts){
                if(proj.Salesforce_Tickets__r.isEmpty()){
                    proj.Status__c = 'Completed';
                }                
            }
            update projWithClosedTckts;
        }
    }
}