public with sharing class updateHighestAmountOppNameQueueable implements Queueable{
    
    public List<Account> accList = new List<Account>();
    /*Inputlist -> Accounts with related Opps*/
    /*100 accounts, each acc with 10 opps
     1 Account with 10 opportunities
     Scenario to find the OppName with highest Amount
     Dummy value = 0/first value
     */
    public updateHighestAmountOppNameQueueable(List<Account> accList){
        this.accList = accList;
    }

    //execute
    public void execute(QueueableContext qc){

        for(Account acc : accList){
            Decimal maxAmount = 0;
            String maxOppName = '';
            
            for(Opportunity opp : acc.Opportunities){
                /*Loop1 - 10 opps
                1 opp - Amount compare =>if high, opp name
                2 opp - Amount compare =>if high, opp name variable will be updated
                3 opp - AMount compare =>if low, oppName will still have the second one
                4 opp - Amount compare =>if high, opp name variable will be updated 

                Delete - 2 Opp, it will not consider SOQL
                Undelete - 2 Opp, it will be there in the SOQL records
             */
                if(opp.Amount != Null && opp.Amount>maxAmount){
                    maxAmount = opp.Amount;
                    maxOppName = opp.Name;
                }
            }
            acc.Highest_Amount_Opportunity_Name__c = maxOppName;
        }
        system.debug('accList'+accList);
        update accList;

    }
}