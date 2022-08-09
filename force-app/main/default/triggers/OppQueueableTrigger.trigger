trigger OppQueueableTrigger on Opportunity (after insert,after update,after delete, after undelete) {

    if(Trigger.isAfter){
        if(Trigger.isInsert){
            OppQueueableTriggerHandler.afterInsert_Delete_UndeleteOpp(Trigger.new);
        }
        if(Trigger.isDelete){
            OppQueueableTriggerHandler.afterInsert_Delete_UndeleteOpp(Trigger.Old);
        }
        if(Trigger.isUndelete){
            OppQueueableTriggerHandler.afterInsert_Delete_UndeleteOpp(Trigger.new);
        }
        if(Trigger.isUpdate){
            OppQueueableTriggerHandler.afterUpdate(Trigger.newMap,Trigger.oldMap);
        }
    }
}