trigger SalesforceProjectPracticeTrigger on Salesforce_Project__c (before insert, after insert,before update, after update) {
    
    if(trigger.isBefore && trigger.isInsert){
        SalesforceProjectPracticeTriggerHandler.preventDuplicates(Trigger.New);
    }

    if(trigger.isAfter && trigger.isInsert){
        SalesforceProjectPracticeTriggerHandler.createTickets(Trigger.New);
    }

    if(trigger.isBefore && trigger.isUpdate){
        SalesforceProjectPracticeTriggerHandler.checkForOpenTickets(Trigger.New,Trigger.newMap);
    }
    
    //Calling Batch class
    if(trigger.isAfter && trigger.isUpdate && !System.isBatch()){
        Database.executeBatch(new salesforceProjectBatch(Trigger.newMap.Keyset()));
    }

}