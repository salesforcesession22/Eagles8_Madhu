public class practiceDML {
    
    public void createContacts(Account acc){
        List<Contact> conList = new List<Contact>();
        for(Integer i=1;i<=10;i++){
            Contact con = new Contact();
            con.FirstName = 'DemoDML'+i;
            con.LastName = acc.Name;
            con.AccountId = acc.id;
            conList.add(con);
        }
        if(!conList.isEmpty()){
            insert conList;
        }
    }

    public void updateOpps(){
        List<Opportunity> oppList = [SELECT Description FROM Opportunity ORDER BY CreatedDate DESC LIMIT 10 ];
        if(!oppList.isEmpty()){
            for(Opportunity opp : oppList){
                opp.Description = 'This is one of the top 10 opportunity. Please work on this as priority';
            }
        }
        update oppList;       
    
    }

    public void createTaskforCase(){
        List<Case> caseList = [Select Status from Case where Status = 'New'];
        List<Task> taskList = new List<Task>();
        for(Case cs : caseList){
            Task tsk =  new Task();
            tsk.Subject = 'Call';
            tsk.Priority = 'Normal';
            tsk.Status = 'Not Started';
            tsk.WhatId = cs.id;
            tsk.ActivityDate = Date.today() + 3;
            taskList.add(tsk);            
        }
        if(!taskList.isEmpty()){
            insert taskList;
        }
    }
    
}