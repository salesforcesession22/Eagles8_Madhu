trigger ValidateAddressQueueableTrigger on Account (after update) {

    /*Added validation to avoid recursive update*/
    if(Trigger.isAfter && Trigger.isUpdate && !system.isQueueable()){
        Set<ID> accIds = new Set<ID>();
        for(Account acc : Trigger.new){
            if(acc.Validation_Status__c == FALSE){
                accIds.add(acc.id);
            }
        }
        if(!accIds.isEmpty()){
            /*Invoke/Initiate the Queueueable*/
            ValidateAddressQueueable queueValdiate = new ValidateAddressQueueable(accIds);
            system.enqueueJob(queueValdiate);
        }
    }
}