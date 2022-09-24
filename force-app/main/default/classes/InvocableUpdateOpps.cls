public class InvocableUpdateOpps {

    @InvocableMethod(Label='Apex Update Opportunities For Flow' 
                     Description='Creating an apex action to update related Opps for the Account'
                     Category='Account')
    public static void UpdateOpps(List<Id> accIds){
        List<Opportunity> oppList = [Select ID, Description from Opportunity where AccountId IN: accIds];      
        if(!oppList.isEmpty()){
            for(Opportunity opp:oppList){
                opp.Description = Label.Opportunity_High_Profile;               
            }
            update oppList;
        }                   
    }

}