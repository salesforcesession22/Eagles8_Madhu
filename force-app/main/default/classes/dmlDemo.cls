public class dmlDemo {
    
    public static void dmlStd(){
        Account acc = new Account();
        acc.Name = 'ApexTest';
        acc.Rating = 'Hot';              
        insert acc;

        acc.AccountSource = 'Web'; 
        acc.Type = 'Prospect';
        update acc;

    }

    public static void dmlCustom(){
        Salesforce_Project__c proj = new Salesforce_Project__c();
        proj.Project_Name__c = 'TestingFromApex';
        insert proj;

        proj.Status__c = 'New';
        proj.Description__c = 'This is for Testing Apex';
        update proj;

    }

    public static void dmlSOQL(){
        Salesforce_Project__c proj = [Select Status__c,Project_Name__c from Salesforce_Project__c where Project_Name__c = 'TestingFromApex' LIMIT 1];
        proj.Status__c = 'In-progress';
        update proj;

    }

    public static void dmlConwithAcc(){
        Account acc = new Account();
        acc.Name = 'AccForRelationship';
        insert acc;
        Contact con = new Contact();
        con.FirstName = 'Shah Ruk';
        con.LastName = 'Khan';
        con.AccountId = acc.id;
        insert con;
    }

    public static void dmlTicketswithProject(){
        Salesforce_Project__c proj = [Select Status__c,Project_Name__c from Salesforce_Project__c where Project_Name__c = 'MVP2' LIMIT 1];
        Salesforce_Ticket__c ticket = new Salesforce_Ticket__c();
        ticket.Subject__c = 'TicketFromApex';
        ticket.Status__c = 'In development';
        ticket.Salesforce_Project__c = proj.id;
        insert ticket;
    }

    public static void dmlwithmoreAccounts(){
        List<Account> accList = new List<Account>();
       
        Account acc1 = new Account();
        acc1.Name = 'TestAccount1';
        accList.add(acc1);

        Account acc2 = new Account();
        acc2.Name = 'TestAccount2';
        accList.add(acc2);

        Account acc3 = new Account();
        acc3.Name = 'TestAccount3';
        accList.add(acc3);

        insert accList;
    }

    public static void dmlwithmoreAccountsForLoop(){
        List<Account> accList = new List<Account>();
        for(Integer i=1;i<=100;i++){
            Account acc = new Account();
            acc.Name = 'ApexAccount'+i;
            accList.add(acc);
        }
        if(!accList.isEmpty()){
            insert accList;
        }

    }

    public static void dmlDelete(){
        List<Account> accListToDelete = [Select Name from Account where Name LIKE 'ApexAccount%'];
        Delete accListToDelete;
    }

    public static void dmlupdateForLoopProject(){
        List<Salesforce_Project__c> projList = [Select Name,Description__c from Salesforce_Project__c];
        for(Salesforce_Project__c proj : projList){
            proj.Description__c = 'This is from Apex';
        }
        if(!projList.isEmpty()){
            update projList;
        }
    }


    public static void dmlDatabaseMethods(){
        List<Account> accList = new List<Account>();
        Account acc1 = new Account(Name = 'DatabaseInsertAccount');
        Account acc2 = new Account(Name = '');
        accList.add(acc1);
        accList.add(acc2);
        insert accList; //Errored
        Database.insert(accList, false); //partial insert 

    }

    public static void upsertDemo(){
        //Insert + Update
        List<Salesforce_Project__c> projList = new List<Salesforce_Project__c>();
        //Creating
        Salesforce_Project__c proj = new Salesforce_Project__c();
        proj.Project_Name__c = 'upsertTesting';              
        projList.add(proj);
        //Updating
        Salesforce_Project__c projUpdate = [Select Name from Salesforce_Project__c limit 1];
        projUpdate.Project_Name__c = 'upsertTestingUpdate';         
        projList.add(projUpdate);
        upsert projList;

    }
}