@isTest
public class practiceDMLTest {
    
    /* Logic - purpose of the method
     * Do you need any pre-setup?  => test data
     * Input?
     * Output?
     * Validation - Assertion
	*/
    
    /*Data created in Test class is a TEST DATA, it won't be stored in org.*/    
   
    @isTest
    public static void createContactsTest(){
        practiceDML demo = new practiceDML();
        //pre-setup
        Account acc = new Account(Name = 'TestAcc');
        insert acc;
        demo.createContacts(acc);
        //Validate
        List<Contact> conList = [Select ID,FirstName,LastName,AccountId FROM Contact];
        system.assert(!conList.isEmpty()); 
        system.assert(conList.size() > 0);
        system.assertEquals(acc.id,conList.get(0).AccountId);
        system.assertEquals('TestAcc', conList.get(2).LastName);
    }
    
    @isTest
    public static void updateOppsTest(){
        //test setup / test data creation
        List<Opportunity> oppList = new List<Opportunity>();
        for(Integer i=1;i<=10;i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'Opp'+i;
            opp.StageName = 'Prospecting';
            opp.CloseDate = Date.today() + 10;
            opp.Description = 'Test Desc';
            oppList.add(opp);
        }
        insert oppList;
        //call the method for testing
        practiceDML demo = new practiceDML();
        demo.updateOpps();
        //Validation
        List<Opportunity> oppListUpdate = [Select Description from Opportunity];
        system.assert(oppListUpdate.size() == 10);
        system.assertEquals('This is one of the top 10 opportunity. Please work on this as priority', oppListUpdate.get(3).Description);
        
    }
    
    @isTest
    public static void createTaskforCaseTest(){
        //test Data setup
        Case cs = new Case();
        cs.Origin = 'Email';
        cs.Status = 'New';
        insert cs;
        //call this method for testing
        practiceDML demo = new practiceDML();
        demo.createTaskforCase();
        //validation
        List<Case> caseList = [Select Status,(Select Subject,Priority,Status,WhatId,ActivityDate from Tasks) from Case];     
        system.assert(caseList.get(0).Tasks.size() == 1);
        system.assertEquals(cs.id, caseList.get(0).Tasks.get(0).WhatId);
    }
    
    
    
    
    
    
    
    
    
    

}