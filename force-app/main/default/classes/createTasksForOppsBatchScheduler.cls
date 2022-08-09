public with sharing class createTasksForOppsBatchScheduler implements Schedulable {
   
    public void execute(SchedulableContext sc){
        Database.executeBatch(new createTasksForOppsBatch());
    }
}