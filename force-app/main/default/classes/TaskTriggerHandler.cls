public with sharing class TaskTriggerHandler {
   //Task is Inserted
    public static void updateLeadOnTaskInsert(List<Task> taskTriNew){
        Set<ID> leadIDs = new Set<ID>();
        //Get the Lead IDs  
        for(Task tsk : taskTriNew){
                if(tsk.WhoId != NULL && tsk.WhoId.getSObjectType().getDescribe().getName() == 'Lead'){
                    leadIDs.add(tsk.WhoId);
                }
        }
        if(!leadIDs.isEmpty()){
            updateLead(leadIDs);
        }        
    }

    //Task is updated
    public static void updateLeadOnTaskUpdate(List<Task> taskTriNew,Map<ID,Task> taskOldMap){
        Set<ID> leadIDs = new Set<ID>();
        //Get the Lead IDs  
        for(Task tsk : taskTriNew){
                if(tsk.WhoId != NULL && tsk.WhoId.getSObjectType().getDescribe().getName() == 'Lead'){
                    //If the Activity date or Status is changed
                    if(tsk.ActivityDate != taskOldMap.get(tsk.id).ActivityDate ||
                       tsk.Status != taskOldMap.get(tsk.id).Status){
                        leadIDs.add(tsk.WhoId);
                    }
                }
        }
        if(!leadIDs.isEmpty()){
            updateLead(leadIDs);
        }        
    }


    public static void updateLead(Set<ID> leadIDs){          
        //SOQL - Query the Lead IDs, respective field
        List<Lead> leadToUpdate = [Select ID, Next_Activity_Date__c, (Select id, ActivityDate, Status FROM Tasks where Status != 'Completed' AND Status !='Deferred' ORDER BY ActivityDate LIMIT 1) FROM Lead where ID IN :leadIDs];
        for(Lead ld : leadToUpdate){
                if(ld.Tasks.size() > 0){
                    if(ld.Tasks.get(0).ActivityDate != NULL)
                    ld.Next_Activity_Date__c = ld.Tasks.get(0).ActivityDate;
                }else{
                    ld.Next_Activity_Date__c = NULL;
                }
        }
        update leadToUpdate;
    }
}