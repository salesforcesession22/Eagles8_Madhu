public class SFProject_FutureTriggerHandler {
    
    @future
    public static void updateProjDescription(Set<ID> projIds){
        //SOQL
        List<Salesforce_Project__c> projList = [Select id, Description__c from Salesforce_Project__c where ID IN: projIds];
        List<Salesforce_Project__c> projUpdateList = new List<Salesforce_Project__c>();
        for(Salesforce_Project__c proj : projList){
            if(proj.Description__c != NULL){                
           		proj.Description__c = proj.Description__c + ' Updated from Future';                
                projUpdateList.add(proj);
            }
        }
        update projUpdateList;        
    }
    
    //a
    public static void prepProjIds(List<Salesforce_Project__c> projTriNew, Map<ID, Salesforce_Project__c> projTriOldMap){
        Set<ID> projIds = new Set<ID>();
        for(Salesforce_Project__c proj : projTriNew){
            if(proj.Status__c != projTriOldMap.get(proj.id).Status__c && proj.Status__c == 'Completed'){
                projIds.add(proj.id);
            }
        }
        if(!projIds.isEmpty()){
            futureupdateTickets(projIds);
        }        
    }
    //b
    @future
    public static void futureupdateTickets(Set<id> projIds){
    //SOQL
    List<Salesforce_Ticket__c> tickList = [Select id, Status__c, Salesforce_Project__c from Salesforce_Ticket__c
                                           where Salesforce_Project__c IN : projIds  AND Status__c !='Completed'];
        if(!tickList.isEmpty()){
                for(Salesforce_Ticket__c tckt : tickList){
                    tckt.Status__c = 'Completed';
                }
            update tickList;
         }
        
    }
    
    

}