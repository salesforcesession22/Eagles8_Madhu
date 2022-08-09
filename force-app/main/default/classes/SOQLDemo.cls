public class SOQLDemo {
   
    //SOQL Basic Query
    public static void accountSOQL1(){
        List<Account> accList = [SELECT ID, Name, Phone, Rating,AccountNumber FROM Account WHERE Name LIKE '%United%'];
        
        system.debug('Account List: '+accList);
        for(Account accValue : accList){
            String accountPhone = accValue.Phone;
            String accountRating = accValue.Rating;
            String accountNumber = accValue.AccountNumber;
            system.debug('Account Name: '+accValue.Name+ ' & ' +
                        'Account Phone: '+accountPhone+ ' & '+
                        'Account Rating: '+accountRating+ ' & '+
                        'Account Number: '+accountNumber);
        }

    }

    //SOQL Single Record
    public static void accountSOQL2(){
        Account acc = [SELECT ID, Name, Phone, Rating,AccountNumber FROM Account WHERE Name LIKE '%United%' LIMIT 1];
        system.debug('Account : '+acc);
        system.debug('Name: ' + acc.Name);
        system.debug('Phone :'+acc.Phone);
        String ratingValue = acc.Rating;
        String accNumber = acc.AccountNumber;
        system.debug('Rating: '+ratingValue);
        system.debug('Account Number :'+accNumber);
        
    }

    //SOQL with variables
    public static void oppSOQLwithVariable(String stageValue){
        //String stageValue = 'Closed Won';
        List<Opportunity> oppList = [SELECT Name,Amount,StageName FROM Opportunity WHERE StageName = : stageValue];
        system.debug('Opportunity List : '+oppList);
    }

    //SOQL for Child to Parent 
    public static void ticketToProject(){
        List<Salesforce_Ticket__c> ticketWithProjectList = 
        [SELECT Name, Priority__c, Salesforce_Project__r.Name, Salesforce_Project__r.Status__c  FROM Salesforce_Ticket__c];
        system.debug('Child to Parent - Ticket to Project : '+ticketWithProjectList);
    }

    //SOQL Parent to Child
    public static void accountToContacts(){
        List<Account> accWithConList = [SELECT Name, (SELECT Name,Phone,Email FROM Contacts) FROM Account];
        for(Account acc : accWithConList){
            system.debug('Account Name :'+acc.Name);
            for(Contact con : acc.Contacts){
                system.debug('Contact Name :'+con.Name);
                system.debug('Contact Phone :'+con.Phone);
                system.debug('Email'+con.Email);
            }
        }
    }

    //SOQL Project to Ticket
    public static void projectToTickets(){
        List<Salesforce_Project__c> projWithTicketsList = [SELECT Project_Name__c, Status__c, (SELECT Name, Priority__c FROM Salesforce_Tickets__r) FROM Salesforce_Project__c];
        for(Salesforce_Project__c proj : projWithTicketsList){
            system.debug('Project Name: '+proj.Project_Name__c);
            system.debug('Proejct Status: '+proj.Status__c);
            for(Salesforce_Ticket__c ticket : proj.Salesforce_Tickets__r){
                system.debug('Ticket Name: '+ticket.Name);
                system.debug('Ticket Priority: '+ticket.Priority__c);
            }
        }
    }

    //SOQL Account to Opportunity
    public static void accToOpps(){
        List<Account> accToOppsList = [SELECT Name,(Select CloseDate from Opportunities where CloseDate  > Today) FROM Account];
        for(Account acc : accToOppsList ){
            system.debug('Account Name: '+acc.Name);
            for(Opportunity opp : acc.Opportunities){
                system.debug('ClosedDate : '+opp.CloseDate);
            }
        }
    }

    public static void SOSLDemo(){
        List<List<sObject>> searchList =   	
        [FIND 'Tom' IN ALL FIELDS RETURNING Lead(Name,Phone),Contact(FirstName,Email)];

        List<Lead> leadList = (List<Lead>)searchList[0];
        List<Contact> conList = (List<Contact>)searchList[1];

        system.debug('Lead List: '+leadList);
        system.debug('Contact List: '+conList);
    }


}