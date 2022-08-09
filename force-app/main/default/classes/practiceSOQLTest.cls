@isTest
public class practiceSOQLTest {
    
    /* Logic - purpose of the method
     * Do you need any pre-setup?  => test data
     * Input?
     * Output?
     * Call the method for Testing
     * Validation - Assertion
	*/
    
    /*Data created in Test class is a TEST DATA, it won't be stored in org.*/ 
    
    @isTest
    public static void fetchOppsTest(){   
        //Call the method
        practiceSOQL.fetchOpps('Closed Won','Partner Referral');
        List<Opportunity> oppListSOQL = [Select StageName,LeadSource from Opportunity];
        //Validation
        system.assertEquals('Closed Won', oppListSOQL.get(1).StageName);
    }
    
    
    @isTest
    public static void printAccswithOppsTest(){
        practiceSOQL.printAccswithOpps();
        List<Account> accList = [Select Name, AnnualRevenue,(Select Name,Amount,LeadSource from Opportunities) from Account];
        system.assert(!accList.isEmpty());
        system.assertEquals('Partner Referral',accList.get(0).Opportunities.get(0).LeadSource);
        
    }
    
    @testSetup
    public static void testDataSetup(){
        //3 accounts
        //300 Opportunity
        List<Account> accList = new List<Account>();
        Account acc1 = new Account();
        acc1.Name = 'FirstAccount';
        acc1.Type = 'Customer - Direct';
        acc1.AnnualRevenue = 1000;
        accList.add(acc1);
        Account acc2 = new Account();
        acc2.Name = 'SecondAccount';
        acc2.Type = 'Customer - Direct';
        acc2.AnnualRevenue = 2000;
        accList.add(acc2);
        Account acc3 = new Account();
        acc3.Name = 'SecondAccount';
        acc3.Type = 'Customer - Direct';
        acc3.AnnualRevenue = 2000;
        accList.add(acc3);
        insert accList;
        
        List<Opportunity> oppList = new List<Opportunity>();
        for(Integer i=1;i<=300;i++){
            Opportunity opp = new Opportunity();
            opp.name = 'Opp'+i;
            opp.StageName = 'Closed Won';
            opp.CloseDate = Date.today() + 10;
            if(i<=100){
                opp.AccountId = accList.get(0).id;
                opp.LeadSource = 'Partner Referral';
            }else if(i<=200){
                opp.AccountId = accList.get(1).id;
            }else if(i<=300){
                opp.AccountId = accList.get(2).id;
            }
            oppList.add(opp);
        }
		insert oppList;        
    }
    
    
    
    
    

}