public class ValidateAddressQueueable implements Queueable{
    
    /*Get the Account Ids to validate address*/
    public Set<ID> accIds = new Set<ID>();
    public ValidateAddressQueueable(Set<Id> accIds){
        this.accIds = accIds;
    }
    
    public void execute(QueueableContext qc){
        /*SOQL - To filter the respective fields for the account*/
        List<Account> accList = [Select BillingState, BillingCountry,Validation_Status__c from Account where ID IN:accIds];

        /*Two Approaches to the solution, Reason to choose Approach 2
         * Approach 1 - Retrieve the Custom Metadata using getInstance(Country)
         * Approach 2 - Write a SOQL to retrieve the Custom Metadata fields and store it in a map
         * After both the approaches, validate that the Billing state is present(contains) in the States field retrieved
         * Reason to choose Approach 2 => Limitations on getInstance in Long text area to retrieve only upto 255 characters, SOQL retrieves entire Long Text area
		*/
        
        /*Note : In general, Custom Metadata has no SOQL limits, but exception of Long text area which is counted in SOQL*/ 
        List<Country_vs_States__mdt> getRecordList = [Select MasterLabel,States__c from Country_vs_States__mdt];
        Map<String,String> mapCountryStates = new Map<String,String>();
        for(Country_vs_States__mdt counState : getRecordList){
            //Storing Master Label as DeveloperName field has Underscores
            mapCountryStates.put(counState.MasterLabel, counState.States__c);
        }
        
        List<Account> accToUpdate = new List<Account>();
        for(Account acc : accList){             
            /*Approach 1 - Commented, try and check the Long text Area retrieval limit
             *String country = acc.BillingCountry.replace(' ','_');
             *Country_vs_States__mdt getRecord = Country_vs_States__mdt.getInstance(country);*/
             
            String getStates = mapCountryStates.get(acc.BillingCountry);  
            /*Check if the state is present in the retrieved values from Custom Metadata*/
            if(getStates.contains(acc.BillingState)){                
                acc.Validation_Status__c = True;
                accToUpdate.add(acc);
            }                        
        }       
        if(!accToUpdate.isEmpty()){
            update accToUpdate;
        }
        
    }    
    
}