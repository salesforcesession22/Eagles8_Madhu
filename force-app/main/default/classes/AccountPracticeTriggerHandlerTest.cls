@isTest
public class AccountPracticeTriggerHandlerTest {
    
    /* Trigger / TriggerHandler => Find the logic that will fire the trigger (DML)
*/
    
    /*@testSetup
        public static void TestDataSetup(){
        List<Account> accList = new List<Account>();
        for(Integer i=0;i<100;i++){
        Account acc = new Account();
        acc.Name = 'Test'+i;
        acc.Active__c = 'No';
        acc.Description = 'Inactive';
        acc.VIP__c = false;
        accList.add(acc);
        }
        insert accList;
        //Insert 100 contacts
        List<Contact> conList = new List<Contact>();
        for(Integer i=0;i<100;i++){
        Contact con = new Contact();
        con.LastName = 'TestContact';
        con.VIP__c = false;            
        con.AccountId = accList.get(i).id;
        conList.add(con);
        }
        insert conList;
    }*/
    
    @isTest
    public static void testMethodUpdate(){
        List<Account> accList = TestDataFactory.createAccounts(100);
        for(Account acc : accList){
            acc.Active__c = 'Yes';
        }
        //fire the trigger
        update accList;
        //Validate 
        //Test Starttest - Test Stoptest (Reset Governor Limit)
        test.startTest();
        List<Account> accListUpdate = [Select Active__c,Description from Account];
        for(Account acc: accListUpdate){
            system.assertEquals('Account is Active', acc.Description);
        }            
        test.stopTest();
        
    }
    
    @isTest
    public static void updateVIPforContactsTest(){
        List<Account> accList = TestDataFactory.createAcctsCons(100,2);        
        for(Account acc : accList){
            acc.VIP__c = true;            
        }
        //trigger will be fired
        update accList;
        //SOQL Contacts
        Test.starttest();
        List<Contact> conList = [Select Id,VIP__c from Contact];
        for(Contact con: conList){
            system.assertEquals(true, con.VIP__c);
        }
        Test.stoptest();
    }
    
    @isTest
    public static void matchMailingAddressContacts(){
        List<Account> accList = TestDataFactory.createAcctsCons(100,2); 
        for(Account acc : accList){
            acc.BillingStreet = 'AccStreet1';
            acc.BillingCity = 'AccCity1';            
            acc.BillingState = 'AccState1';
            acc.BillingCountry = 'AccCountry1';
            acc.BillingPostalCode = 'AccCode1';            
        }
        update accList;//trigger will be fired
        Test.startTest();
        List<Contact> conList = [Select Account.BillingStreet,Account.BillingCity,Account.BillingState,Account.BillingCountry,Account.BillingPostalCode,
                                 MailingStreet,MailingCity,MailingState,MailingCountry,MailingPostalCode from Contact];
        for(Contact con: conList){
            system.assertEquals(con.Account.BillingStreet, con.MailingStreet);
            system.assertEquals(con.Account.BillingCity, con.MailingCity);
            system.assertEquals(con.Account.BillingState, con.MailingState);
            system.assertEquals(con.Account.BillingCountry, con.MailingCountry);
            system.assertEquals(con.Account.BillingPostalCode, con.MailingPostalCode);
        }
        Test.stopTest();
        
    }    
    
    
      
    
}