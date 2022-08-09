public with sharing class demoBatchErrorHandling implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([Select ID,Name from Account]);
    }

    public void execute(Database.BatchableContext bc, List<Account> records){
        List<Contact> conList = new List<Contact>();
        for(Account acc : records){
            Contact con = new Contact();
            con.LastName = NULL;
            conList.add(con);
        }

        
    List<Database.SaveResult> saveResultList = Database.insert(conList, false);
    // Iterate through saveResultList based on isSuccess capture the successful records
    for (Database.SaveResult sr : saveResultList) {
        if (sr.isSuccess()) {
            // Operation was successful, so get the ID of the record that was processed
            System.debug('Successfully inserted ' + sr.getId());
        }
        else {
            // Operation failed, so get all errors                
            for(Database.Error err : sr.getErrors()) {
                //store this info in Log object 
                //BatchName
                //Error Message
                System.debug('Error Handling : '+err.getStatusCode() + ': ' + err.getMessage());                
            }
        }
    }

    }

    public void finish(Database.BatchableContext bc){

    }
}