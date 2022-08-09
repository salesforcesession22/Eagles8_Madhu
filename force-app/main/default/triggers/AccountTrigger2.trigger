trigger AccountTrigger2 on Account (after update) {
    if(trigger.isAfter && trigger.isUpdate){
        AccountTriggerHandler2.updateCase(Trigger.newMap,Trigger.oldMap);
    }
}