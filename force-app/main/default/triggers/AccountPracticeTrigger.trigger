trigger AccountPracticeTrigger on Account (before insert,before update, after insert, after update, before delete, after delete, after undelete) {
   
       
    //NO DML Inside before Triggers 
    //Scenario 1   
    if(Trigger.isBefore && Trigger.isInsert){        
        AccountPracticeTriggerHandler.fillShippingDetails(Trigger.New);            
    }
    
    //Scenario 4 / Scenario 6
    if(Trigger.isAfter && Trigger.isUpdate){
        AccountPracticeTriggerHandler.matchMailingAddressContacts(Trigger.New, Trigger.OldMap);
        AccountPracticeTriggerHandler.contactVIPUpdate(Trigger.New,Trigger.NewMap,Trigger.OldMap);
                
    }
    
    //Scenario 5
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate))
    {
        Boolean directFlag = false;
        directFlag = Trigger.isInsert;
        AccountPracticeTriggerHandler.updateAccDescription(Trigger.new,Trigger.OldMap,directFlag);
    }
    
    //Sceanrio 6
    if(Trigger.isBefore && Trigger.isDelete){
        AccountPracticeTriggerHandler.addErrorOnDelete(Trigger.old);
    }

    //Scenario 7
    if(Trigger.isAfter && Trigger.isDelete){
        AccountPracticeTriggerHandler.sendEmailOnDelete(Trigger.old);
    }
    
    //Sceanrio 8
    if(trigger.isAfter && Trigger.isUndelete){
        AccountPracticeTriggerHandler.sendEmailOnUndelete(Trigger.new);
    }
    
    //Practice 1
    if(Trigger.isAfter && Trigger.isUpdate){
        AccountPracticeTriggerHandler.updateOpps(Trigger.new);
    }
    
    //Queueable Call
    if(Trigger.isAfter && Trigger.isInsert  && !system.isQueueable()){        
        system.enqueueJob(new secondJobQueueable(Trigger.new));
    }
}