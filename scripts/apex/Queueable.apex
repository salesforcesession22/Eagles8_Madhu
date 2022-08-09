List<Lead> inputList = [Select ID,Status from Lead];
updateLeadStatusQueueable leadQueue = new updateLeadStatusQueueable(inputList);
//Execute the Queueable 
system.enqueueJob(leadQueue);

system.enqueueJob(new firstJobQueueable());

