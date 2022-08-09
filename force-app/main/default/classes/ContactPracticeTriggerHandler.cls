public class ContactPracticeTriggerHandler {
    
     //Scenario 2a
    public static void errorValidation1(List<Contact> conList){
        for(Contact con : conList){
            if(con.LeadSource == 'Partner Referral'){
                con.LeadSource.addError('Cannot insert/update with Partner Referral');
            }
        }
        
    }
    
    //Scenario 2b
    public static void errorValidation2(List<Contact> conList, Map<ID,Contact> conOldMap){
        //LeadSource - Web
        //LeadSource - Phone Inquiry
        for(Contact con : conList){
            //Map<Key,Value>, to retrieve the values, get(Key)
            //conOldMap.get(con.id) => Contact record
            if(con.LeadSource != conOldMap.get(con.id).LeadSource){
                String error2 = Label.ErrorValidation2;
                con.addError(error2);
            }
        }
    }
    
    //Practice 2
    public static void phoneFieldUpdate(List<Contact> conList){
        Set<ID> accIds = new Set<ID>();
		//Fetching the Account IDs        
        for(Contact con : conList){
            if(con.AccountId != NULL){
                accIds.add(con.AccountId);
            }
        }
        //SOQL - Account
        List<Account> accList = [Select id,Phone from Account where ID IN: accIds];
        Map<ID,Account> accMap = new Map<ID,Account>();
        for(Account acc : accList){
            accMap.put(acc.id,acc);
        }
        
        //Looping through Contacts to fill other phone(contact) to phone(account)
        for(Contact con : conList){
            if(accMap.containsKey(con.AccountId)){
                con.OtherPhone = accMap.get(con.AccountId).Phone;
            }
        }
        
        
    }
	
}