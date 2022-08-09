public with sharing class OppQueueableTriggerHandler {
    
    /*Input Opportunity 
     Filter Accounts are available !=NULL, store it in a List/set
     SOQL - with Opportunities
     Call Queueable - List<Account>
    */


    public static void afterInsert_Delete_UndeleteOpp(List<Opportunity> oppList){
        Set<ID> accIDS = new Set<ID>();
        //Filter Accounts are available !=NULL, store it in a List/set
        for(Opportunity opp : oppList){
            if(opp.AccountId != NULL){
                accIDS.add(opp.AccountId);
            }
        }
        //SOQL
        List<Account> accList = [Select id, name, Highest_Amount_Opportunity_Name__c, (Select Amount, Name from Opportunities where Stagename = 'Closed Won') From Account Where id in : accIds];
        //Call Queueable - List<Account>
        system.enqueueJob(new updateHighestAmountOppNameQueueable(accList));

    }

    public static void afterUpdate(Map<ID,Opportunity> oppNewMap, Map<Id,Opportunity> oppOldMap){
        Set<ID> accIDS = new Set<ID>();
        for(Opportunity opp : oppNewMap.values()){
            if(opp.AccountId != NUll && oppNewMap.get(opp.id).Amount != oppOldMap.get(opp.id).Amount){
                accIDS.add(opp.AccountId);
            }
        }
        //SOQL
        List<Account> accList = [Select id, name, Highest_Amount_Opportunity_Name__c, (Select Amount, Name from Opportunities where Stagename = 'Closed Won') From Account Where id in : accIds];
        //Call Queueable - List<Account>
        system.enqueueJob(new updateHighestAmountOppNameQueueable(accList));
    }

}