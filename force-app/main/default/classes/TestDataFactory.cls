@isTest
public class TestDataFactory {    

    //Creating Projects
    public static List<Salesforce_Project__c> createProjects(Integer countProj){
        List<Salesforce_Project__c> projList = new List<Salesforce_Project__c>();        
        for(Integer i=0;i<countProj;i++){
            Salesforce_Project__c proj = new Salesforce_Project__c();
            proj.Project_Name__c = 'Test'+i;
            proj.Description__c = 'Sample';
            proj.Status__c = 'New';
            projList.add(proj);            
        }
        insert projList;
        return projList;
    }
    
    //create projects with tickets
    public static List<Salesforce_Project__c> createProjTckts(Integer countProj, Integer countTckts){
        List<Salesforce_Project__c> projList = new List<Salesforce_Project__c>(); 
        Integer i,j;
        for(i=0;i<countProj;i++){
            Salesforce_Project__c proj = new Salesforce_Project__c();
            proj.Project_Name__c = 'Test'+i;
            proj.Description__c = 'Sample';
            proj.Status__c = 'New';
            projList.add(proj);            
        }
        insert projList;
        
		List<Salesforce_Ticket__c> tickList = new List<Salesforce_Ticket__c>();        
        for (j=0; j<countProj; j++) {
            // For each : Salesforce Project just inserted, add Salesforce Tickets
            for (Integer k=1; k<=countTckts; k++) {
                Salesforce_Ticket__c tick = new Salesforce_Ticket__c();
                tick.Salesforce_Project__c = projList.get(j).id;
                tick.Subject__c = 'Subject ' + k;
                tick.Status__c = 'New';
                tick.Priority__c = 'Medium';
                tickList.add(tick);
                system.debug('Before'+tick.Status__c);
            }
        }    
        insert tickList;        
        return projList;
        
        
    }

   
    //create accounts
    public static List<Account> createAccounts(Integer countAccts){
        List<Account> accList = new List<Account>();
        for(Integer i=0;i<countAccts;i++){
            Account acc = new Account();
            acc.Name = 'Test'+i;
            acc.Active__c = 'No';
            acc.Description = 'Inactive';
            acc.VIP__c = false;            
            accList.add(acc);
        }
        insert accList;
        return accList;
    }
    
    //create accounts with contacts
    public static List<Account> createAcctsCons(Integer countAcc, Integer countCons){
        List<Account> accList = new List<Account>();
        Integer i,j;
        for(i=0;i<countAcc;i++){
            Account acc = new Account();
            acc.Name = 'Test'+i;
            acc.Active__c = 'No';
            acc.Description = 'Inactive';
            acc.VIP__c = false;
            acc.BillingStreet = 'AccStreet';
            acc.BillingCity = 'AccCity';            
            acc.BillingState = 'AccState';
            acc.BillingCountry = 'AccCountry';
            acc.BillingPostalCode = 'AccCode';
            accList.add(acc);
        }
        insert accList;
        //Insert 100 contacts
        List<Contact> conList = new List<Contact>();
		for (i=0; j<countAcc; i++){
            // For each : Account just inserted, add Contacts
            for(j=0; j<countCons; j++){   
                Contact con = new Contact();
                con.LastName = 'TestContact';
                con.VIP__c = false;            
                con.AccountId = accList.get(i).id;
                con.MailingStreet = 'conStreet';
                con.MailingCity =  'conCity';
                con.MailingState = 'conState';
                con.MailingCountry = 'conCountry';
                con.MailingPostalCode = 'conCode'; 
                conList.add(con);
        	}                 
    	}
        insert conList;
        return accList;
    }

    //create Lead records
    public static List<Lead> createLeads(Integer countLead){
        List<Lead> leadList = new List<Lead>();
        for(Integer i=0;i<countLead;i++){
            Lead ld = new Lead();
            ld.LastName = 'LeadQueue'+i;
            ld.Company = 'ABC';
            ld.Status = 'Working - Contacted';
            leadList.add(ld);
        }
        if(!leadList.isEmpty()){
            insert leadList;
        }
        return leadList;
    }
    
    public static List<Case> createCaseAccts(Integer countAcc,Integer countCase){
        List<Account> accList = new List<Account>();
        Integer i,j,k;
        for(i=0;i<countAcc;i++){
            Account acc = new Account();
            acc.Name = 'Test'+i;
            if(i==0){
              acc.CustomerPriority__c = 'High';   
            }else{
            acc.CustomerPriority__c = 'Low';
            }
            accList.add(acc);
        }
        insert accList;
        system.debug('accList'+accList);
        List<Case> caseList = new List<Case>();
        for(j=0;j<countAcc;j++){
            for(k=0;k<countCase;k++){
                system.debug('enter inside');
                Case cs = new case();
                cs.Status = 'New';
                cs.Origin = 'Phone';                
                cs.AccountId = accList.get(j).id;
                cs.Support_Plan__c = NULL;
                caseList.add(cs);       
            }
        }
        insert caseList;
        system.debug('caseListTest'+caseList);
        return caseList;
    }

    //create opps
    public static List<Opportunity> createOpps(Integer countOpps){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Integer i=0;i<countOpps;i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'TestBatch'+i;
            opp.StageName = 'Prospecting';
            opp.CloseDate = system.today() +10;
            opp.OwnerId = Userinfo.getUserId();
            //opp.LastModifiedDate = system.today() - 10;
            oppList.add(opp);
        }
        insert oppList;
        return oppList;
    }
    
    
}