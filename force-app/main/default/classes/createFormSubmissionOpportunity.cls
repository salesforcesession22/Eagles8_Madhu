public class createFormSubmissionOpportunity {
    /*Entering comment to push back*/
    @AuraEnabled        
    public static List<String> getPickListValuesStage(){
        List<String> pickListValuesList = new List<String>();
        Schema.DescribeFieldResult fieldResult = Opportunity.StageName.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            pickListValuesList.add(pickListVal.getLabel());            
        }     
        system.debug('values'+pickListValuesList);
        return pickListValuesList;
    }
    
    @AuraEnabled
    public static void createOppRecord(Opportunity OppTest){
        if(OppTest!=NULL){
            insert OppTest;
        }
    }
    

    

}