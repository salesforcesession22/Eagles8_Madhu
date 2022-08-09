@isTest
public with sharing class Assignment3_FutureMethodTest {

    @TestSetup
    static void makeData(){
       //Create 10 contacts
       List<Contact> conList = new List<Contact>(); 
       for(Integer i=1; i<=5; i++){
        Contact con = new Contact();
        con.FirstName = 'testContact';
        con.LastName = 'EmailContact'+i;
        String email = 'test'+i+'@test.com';
        con.Email = email;
        conList.add(con);
       }
       insert conList;
    }

    @isTest 
    public static void sendEmailToContactTest(){
        List<Contact> conList  = [Select ID,LastName,Email from Contact];
        Set<Id> contactIds = new Set<Id>();
        for(Contact con : conList){
            contactIds.add(con.id);
        }
        Test.startTest();
            Assignment3_FutureMethod.sendEmailToContact(contactIds);
        Test.stopTest();
        system.assert(Assignment3_FutureMethod.isSent);

        //Num of the times the email is sent - Didn't work in future context so try the boolean 
    
        /*Integer emailCount = Limits.getEmailInvocations();
        system.assertEquals(1, emailCount);*/
        
           
        
    }
    
}