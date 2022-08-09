public class practiceSOQL {
    
    public static void fetchOpps(String oppStageName, String leadSrc){
        List<Opportunity> oppsList = [Select Name,Amount from Opportunity 
                                      where StageName =:oppStageName AND LeadSource =:leadSrc];
        system.debug('Opportunity List : '+oppsList);
    }
    
    public static void printAccswithOpps(){
        List<Account> accWithOppsList = [Select Name, AnnualRevenue, 
                                         (Select Name,Amount from Opportunities where StageName = 'Closed Won') 
                                         from Account where type = 'Customer - Direct' AND AnnualRevenue != NULL];
        for(Account acc : accWithOppsList){
            system.debug('Account Name : '+acc.Name+' and its Annual Revenue is : '+acc.AnnualRevenue);
            for(Opportunity opp : acc.Opportunities){
                system.debug('Opportunity Name and Amount : '+opp.Name+ ' '+opp.Amount);
            }
        }
    }

}