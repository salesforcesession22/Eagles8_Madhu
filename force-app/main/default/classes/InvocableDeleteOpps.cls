public class InvocableDeleteOpps {
    
    @InvocableMethod(Label='Apex Delete Opportunities For Flow' 
                     Description='Creating an apex action to delete related Opps for the Account'
                     Category='Account')
    public static void deleteOpps(List<Id> accIds){
        List<Opportunity> oppList = [Select ID, StageName from Opportunity where AccountId IN: accIds AND 
                                    (StageName = 'Closed Won' OR StageName = 'Closed Lost')];
        if(!oppList.isEmpty()){
            Delete oppList; 
        }
                   
    }

}