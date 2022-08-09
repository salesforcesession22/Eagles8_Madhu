public with sharing class firstJobQueueable implements Queueable{
/*Job1 - Create Accs (call Job2 from Job1)*/
    //execute
    public void execute(QueueableContext qc){
        List<Account> accList = new List<Account>();
        for(Integer i=0;i<10;i++){
            Account acc = new Account();
            acc.Name = 'Queue'+i;
            accList.add(acc);            
        }
        if(!accList.isEmpty()){
            insert accList;
        }

        secondJobQueueable secondJob = new secondJobQueueable(accList);
        system.enqueueJob(secondJob);
    }
    
}