public with sharing class deleteOppsInvocable {
    
    @InvocableMethod
    public static void deleteOpps(List<Id> accIds){        
        List<Opportunity> oppList = [Select ID,StageName, AccountId from Opportunity where AccountId IN:accIds AND StageName = 'Closed Lost'];
        if(!oppList.isEmpty()){
            Delete oppList;
        }       
    }

}