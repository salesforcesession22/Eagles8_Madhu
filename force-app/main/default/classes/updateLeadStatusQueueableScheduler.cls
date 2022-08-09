public with sharing class updateLeadStatusQueueableScheduler implements Schedulable{
   //Execute
   public void execute(SchedulableContext sc){
    List<Lead> inputList = [Select ID,Status from Lead];
    updateLeadStatusQueueable leadQueue = new updateLeadStatusQueueable(inputList);
    //Execute the Queueable 
    system.enqueueJob(leadQueue);
   }
}