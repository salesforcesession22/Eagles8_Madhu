trigger ContactPracticeTrigger on Contact (before insert, before update) {

    //Scenario 2a
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
        ContactPracticeTriggerHandler.errorValidation1(Trigger.new);
        }
        if(Trigger.isUpdate){
        ContactPracticeTriggerHandler.errorValidation2(Trigger.New,Trigger.OldMap);    
        }
    }
    
    //Practice 2 
    if(Trigger.isBefore && Trigger.isInsert){
        ContactPracticeTriggerHandler.phoneFieldUpdate(Trigger.new);
    }
}