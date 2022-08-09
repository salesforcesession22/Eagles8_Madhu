public class displayOppsAmountHighest {

    @invocableMethod
    public static List<Opportunity> displayOpps(List<ID> accIds){
        List<Opportunity> oppList = [Select ID, Name, Amount from Opportunity where AccountId IN:accIds AND Amount != NULL ORDER BY Amount Limit 1];
        return oppList;
    }
    
}