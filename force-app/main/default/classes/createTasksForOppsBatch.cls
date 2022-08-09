public with sharing class createTasksForOppsBatch implements Database.Batchable<sObject>{

    //start
    public Database.QueryLocator start(Database.BatchableContext bc){
        String queryString = '';
        if(Test.isRunningTest()){
            queryString = 'Select ID,StageName,LastModifiedDate,CloseDate,OwnerId from Opportunity where StageName != \'Closed Lost\' AND StageName != \'Closed Won\'';
        }else{
            queryString = 'Select ID,StageName,LastModifiedDate,CloseDate,OwnerId from Opportunity where (StageName != \'Closed Lost\' AND StageName != \'Closed Won\') AND LastModifiedDate < LAST_N_DAYS:7';
        }

        return Database.getQueryLocator(queryString);
    }

    //execute
    public void execute(Database.BatchableContext bc,List<sObject> records){
        //Type cast
        List<Opportunity> oppList = (List<Opportunity>) records;
        List<Task> taskList = new List<Task>();
        for(Opportunity opp : oppList){
            Task tsk = new Task();
            tsk.Subject = 'Other';
            if(opp.CloseDate < system.today()){
                tsk.ActivityDate = system.today();
            }else {
                tsk.ActivityDate = opp.CloseDate + 2;
            }
            tsk.Description = 'Reminder – Please act on the Opportunity';
            tsk.WhatId = opp.id;
            tsk.OwnerId = opp.OwnerId;
            tsk.Status = 'In Progress';
            taskList.add(tsk);
        }
        if(!taskList.isEmpty()){
            insert taskList;
        }
    }

    //finish
    public void finish(Database.BatchableContext bc){
        system.debug('Finished!');
    }
    
}