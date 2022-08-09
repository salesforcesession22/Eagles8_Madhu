public  class Assignment1 {
    /**
    * Method Name: getAccounts
    * Input Parameters: NA
    * Return Type: List<Account>
    * Method Body: Get all the accounts whose type is not null and 
      return the same
    */
    public List<Account> getAccounts(){
        List<Account> accList = [Select ID,Name,Type from Account where Type!=NULL];
        return accList;
    }

    /**
    * Method Name: populateAllowanceStatus
    * Input Parameters: List<Allowance__c> allowances
    * Return Type: NA
    * Method Body: Go over the inputted collection of allowances
    * => Check if status is not populated
    * => If yes, get it popolatedto 'Submitted'
    * => and update the only targeted allowance records
    */

    //List<Allowance> - 1 group of data with Status, 1 group of data without status
    //10 allowance - 5 with status null

    public void populateAllowanceStatus(List<Allowance__c> allowances){
        List<Allowance__c> allowanceToUpdate = new List<Allowance__c>();
        for(Allowance__c al : allowances){
            if(al.Status__c == NULL){
                al.Status__c = 'Submitted';
                allowanceToUpdate.add(al);
            }
        }
        if(!allowanceToUpdate.isEmpty())
        update allowanceToUpdate;
        system.debug('Print list: '+allowanceToUpdate);
    }

    /**
    * Method Name: updateAccountNumbers
    * Input Parameters: Map<Id, Account> records
    * Return Type: NA
    * Method Body: Go over the inputted collection of account records
    * (Clue: You cant iterate over a map using for loop. You always need 
    an array/list/set)
    * => Check if account number is null
    * => If yes, get it populated to 'ABC123456'
    * => and update only targeted account records
    */

    public void updateAccountNumbers(Map<ID,Account> records){
        //records.keySet() => Ids (Set)
        //record.Values() => Account (List)        
        List<Account> accountsToUpdate = new List<Account>();       
        for(Account acc : records.values()){
            if(acc.AccountNumber == NULL){
               acc.AccountNumber = 'ABC123456'; 
               accountsToUpdate.add(acc);
            }
        }
        system.debug('print acclist: '+accountsToUpdate);
        if(!accountsToUpdate.isEmpty())
        update accountsToUpdate;

    }

    /**
    * Method Name: countValidContacts
    * Input Parameters: NA
    * Return Type: NA
    * Method Body: Get all the accounts along with its children contacts 
    whose email is not null
    * => Go over the accounts, count the number of contact records
    * and update the same in Number_of_Contacts__c field of account
    */
    //Which object to update? - Account
    //Number_of_Contacts__c = ? Number of child records
    //1 Account 5 child contacts, 3 not null.

    public void countValidContacts(){
        List<Account> accWithContacts = [Select ID,Name,
                            (Select ID,Name,Email from Contacts where Email != NULL)
                                        from Account ];
        for(Account acc : accWithContacts){
            //for(Contact con : acc.Contacts)
            acc.Number_of_Contacts__c = acc.Contacts.size();
        }
        update accWithContacts;

    }

    /**
    * Method Name: populateCasePriority
    * Input Parameters: NA
    * Return Type: NA
    * Method Body: Get all the cases along with its parent account's 
    customer priority field
    * => Do not get cases whose account's customer priority is null
    * => copy account's customer priority value into case priority field
    * => update cases
    */
    //1 to many - Parent (1) / Child (Many)
    //Select id,priority,Account.CustomerPriority__c from Case where Account.CustomerPriority__c !=NULL

    //High - Medium
    //Low - High
    //Medium - Low

    public void populateCasePriority(){
        List<Case> caseWithAcc = [Select ID,Priority,Account.CustomerPriority__c from Case 
                                  where Account.CustomerPriority__c != NULL];
        for(Case cs : caseWithAcc){
            cs.Priority = cs.Account.CustomerPriority__c;
        }
        update caseWithAcc;
    }
}