public class InvocableSFBatch {
    
     @InvocableMethod(Label='Apex Execute Batch' 
                     Description='Creating an apex action to execute a batch by passing Account Ids'
                     Category='Account')
    public static void executeSFProjectBatch(List<Id> accIds){
        
        Set<Id> accIdsSet = new Set<Id>();
        accIdsSet.addAll(accIds);          
        Database.executeBatch(new salesforceProjectBatch(accIdsSet));               
    }
    
    

}