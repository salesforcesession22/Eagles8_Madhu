public class SalesforceProjectPracticeTriggerHandler {

    public static void createTickets(List<Salesforce_Project__c> projNew){
        List<Salesforce_Ticket__c> tickList = new List<Salesforce_Ticket__c>();
        for(Salesforce_Project__c proj : projNew){
            Salesforce_Ticket__c tckt = new Salesforce_Ticket__c();
            tckt.Priority__c = 'Medium';
            tckt.Subject__c = 'Default Ticket';
            tckt.Salesforce_Project__c = proj.id;
            tickList.add(tckt);
        }
        if(!tickList.isEmpty()){
            insert tickList;
        }        
    }

    public static void checkForOpenTickets(List<Salesforce_Project__c> projNew,Map<ID,Salesforce_Project__c> projNewMap){        
        //Add only the IDs if it is marked as Completed
        Set<Id> projIds = new Set<Id>();
        for (Salesforce_Project__c proj : projNew){
            if(proj.Status__c == 'Completed'){
                projIds.add(proj.id);
            }
        }
        //SOQL to fetch open tickets for the Project
        if(!projIds.isEmpty()){        
            List<Salesforce_Project__c> projWithTicketsOpen = [Select ID,Status__c,(Select ID,Status__c from Salesforce_Tickets__r where Status__c !='Completed') FROM Salesforce_Project__c where ID IN:projIds];
            for(Salesforce_Project__c proj : projWithTicketsOpen){
                if(proj.Salesforce_Tickets__r.size() > 0){
                    //AddError can be used only with Context variables
                    //proj.addError('test'); - See the error
                    projNewMap.get(proj.id).addError('Project cannot be completed with Open Tickets');
                }
            }
        }
    }
    
    public static void preventDuplicates(List<Salesforce_Project__c> projNew){
        Map<String,Salesforce_Project__c> projNameMap = new Map<String,Salesforce_Project__c>();
        for(Salesforce_Project__c proj : projNew){
            projNameMap.put(proj.Project_Name__c,proj);
        }
        //SOQL to check existing Project records
        List<Salesforce_Project__c> projList = [Select ID,Project_Name__c FROM Salesforce_Project__c where Project_Name__c IN:projNameMap.keySet()];
        if(!projList.isEmpty()){
            for(Salesforce_Project__c proj : projList){
                projNameMap.get(proj.Project_Name__c).addError('Duplicate Project cannot be created');
            }
        }
    }
}