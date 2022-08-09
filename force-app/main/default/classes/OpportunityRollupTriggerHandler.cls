public with sharing class OpportunityRollupTriggerHandler {
    public static void afterInsertRollup(List<Opportunity> oppTriNew){
        //Find the parent Account Ids
        Set<ID> accIds = new Set<ID>();
        for(Opportunity Opp : oppTriNew){
            if(opp.AccountId != NULL){
                accIds.add(opp.AccountId);
            }
        }
        if(!accIds.isEmpty()){
            updateAccwithRollup(accIds);
        }
    }

    public static void afterUpdateRollup(List<Opportunity> oppTriNew, Map<ID,Opportunity> oppOldMap){
        Set<ID> accIds = new Set<ID>();
        for(Opportunity Opp : oppTriNew){
            if(opp.AccountId != oppOldMap.get(Opp.id).AccountId){
                accIds.add(opp.AccountId);
            }
        }
        if(!accIds.isEmpty()){
            updateAccwithRollup(accIds);
        }
    }

    public static void afterDeleteRollup(List<Opportunity> oppTriOld){
         //Find the parent Account Ids
         Set<ID> accIds = new Set<ID>();
         for(Opportunity Opp : oppTriOld){
             if(opp.AccountId != NULL){
                 accIds.add(opp.AccountId);
             }
         }
         if(!accIds.isEmpty()){
            updateAccwithRollup(accIds);
        }
    }

    public static void updateAccwithRollup(Set<ID> accIds){
        //SOQL to fetch the Account details 
        List<Account> accToUpdate = [Select ID,Count_of_Opps__c,Sum_of_Amount_Opps__c,
                                    (Select ID, StageName, Amount from Opportunities) from 
                                    Account where ID IN:accIds];
        for(Account acc : accToUpdate){
            //Count of Number of related opps
            acc.Count_of_Opps__c = acc.Opportunities.size();
            //Sum of the Ammount of the related Opps
            Decimal sumOfAmount = 0;            
            for(Opportunity opp : acc.Opportunities){
                sumOfAmount = sumOfAmount + opp.Amount;                            
            }
            acc.Sum_of_Amount_Opps__c = sumOfAmount;
           
        }
        update accToUpdate;
    }
}