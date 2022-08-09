public with sharing class salesforceProjectBatchScheduler implements Schedulable{

    //Execute
    public void execute(SchedulableContext sc){
        Database.executeBatch(new salesforceProjectBatch(),1);
    }
}