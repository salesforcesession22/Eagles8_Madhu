trigger TaskTrigger on Task (after insert, after update) {

    if(Trigger.isAfter){
        if(Trigger.isInsert){
            TaskTriggerHandler.updateLeadOnTaskInsert(Trigger.new);
        }
        if(Trigger.isUpdate){
            TaskTriggerHandler.updateLeadOnTaskUpdate(Trigger.new, Trigger.oldMap);
        }
    }


}