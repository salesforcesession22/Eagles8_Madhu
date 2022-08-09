trigger AccountRecursiveTrigger on Account (after insert) {
    
    if(Trigger.isAfter && Trigger.isInsert){
        if(!AccountRecursiveTriggerHandler.isTriggerFirstRun){
            AccountRecursiveTriggerHandler.recursivePractice(Trigger.new);
        }
    }

}