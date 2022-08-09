trigger OpportunityRollupTrigger on Opportunity (after insert,after update,after Delete) {

    if(Trigger.isAfter){
        if(Trigger.isInsert){
            OpportunityRollupTriggerHandler.afterInsertRollup(Trigger.new);
        }
        if(Trigger.isUpdate){
            OpportunityRollupTriggerHandler.afterUpdateRollup(Trigger.new,Trigger.oldMap);
        }
        if(Trigger.isDelete){
            OpportunityRollupTriggerHandler.afterDeleteRollup(Trigger.old);
        }
    }
}