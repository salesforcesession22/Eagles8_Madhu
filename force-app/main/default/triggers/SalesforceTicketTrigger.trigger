trigger SalesforceTicketTrigger on Salesforce_Ticket__c (after update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        SalesforceTicketTriggerHandler.projMarkComplete(Trigger.new); 
    }

}