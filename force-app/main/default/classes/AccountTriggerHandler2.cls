public with sharing class AccountTriggerHandler2 {

    //Step1 - Compare new and old values(Rating) in the map, if rating changed store it in Set/List
    //Step2 - SOQL retrieve Cases, who parentID must be in the set/list
    //Step3 - Loop cases, assign case priority with account rating (condition)
    //Step4 - update cases
    
    public static void updateCase(Map<ID,Account> accNewMap, Map<ID,Account> accOldMap){
        //Get All Accounts for which Rating is changed
        Set<ID> accIDs = new Set<ID>();
        for(Account acc : accNewMap.values()){
            if(accNewMap.get(acc.id).Rating != accOldMap.get(acc.id).Rating){
                accIDs.add(acc.id);
            }
        }
        //SOQL to retrieve cases
        If(!accIDs.isEmpty()){
            List<Case> caseList = [Select CaseNumber,Account.Rating,Priority from 
                                Case where AccountId IN:accIDs];
            if(!caseList.isEmpty()){
                for(Case cs: caseList){
                    if(cs.Account.Rating == 'Hot'){
                        cs.Priority = 'High';
                    }else if(cs.Account.Rating == 'Warm'){
                        cs.Priority = 'Medium';
                    }else if(cs.Account.Rating == 'Cold'){
                        cs.Priority = 'Low';
                    }                    
                }
                update caseList;
            }
        }

    }

}