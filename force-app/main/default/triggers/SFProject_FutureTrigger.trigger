trigger SFProject_FutureTrigger on Salesforce_Project__c (after insert, after update) {
    
    
        if(trigger.isAfter && trigger.isInsert && !System.isFuture()){
            //newMap - <ID,Object>
            SFProject_FutureTriggerHandler.updateProjDescription(Trigger.newMap.keySet());  
        }
        if(trigger.isAfter && trigger.isUpdate && !System.isFuture()){
            SFProject_FutureTriggerHandler.prepProjIds(Trigger.new,Trigger.oldMap);
        }
        


}