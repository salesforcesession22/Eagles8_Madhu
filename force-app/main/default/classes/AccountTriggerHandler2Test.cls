@isTest
public class AccountTriggerHandler2Test {

    @TestSetup
    static void makeData(){
        //Create 500 accounts
        List<Account> accList = new List<Account>();
        for(Integer i=0; i<500;i++){
            Account acc = new Account();
            acc.Name = 'Test Account'+i;
            if(i<200){
                acc.Rating = 'Hot';
            }else if(i<400){
                acc.Rating = 'Warm';
            }else if(i<500){
                acc.Rating = 'Cold';
            }
            accList.add(acc);
        }
        insert accList;
        //Create 500 cases for all Accounts
        List<Case> caseList = new List<Case>();
        for(Account acc : accList){
            Case cs = new Case();
            cs.AccountId = acc.id;
            cs.Status = 'New';
            cs.Origin = 'Phone';
            cs.Priority = 'Low';
            caseList.add(cs);
        }
        insert caseList;

    }

    //1.Create Account with Cases
    //2.Fire the trigger - Update the Rating value of the Account (Rating - Hot to Warm)
    //3.SOQL - Retrieve the cases 
    //4.Validation - check the respective priority field in cases (Priority - Medium)

    @isTest
    public static void updateCaseTest(){
        List<Account> accList = [Select ID,Rating from Account where Rating ='Hot'];
        for(Account acc :  accList){
            acc.Rating = 'Warm';
        }
        update accList; // Trigger will be fired
        Test.startTest();
        List<Case> caseList = [Select Priority, AccountId from Case where AccountId IN:accList];
        for(Case cs: caseList){
            system.assertEquals('Medium', cs.Priority);
        }
        Test.stopTest();

    }
    
}