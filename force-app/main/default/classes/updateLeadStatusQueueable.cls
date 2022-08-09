public with sharing class updateLeadStatusQueueable implements Queueable{
    
 /*Scenario - Update all the Leads with 'Working - Contacted' status to 'Closed - Coverted'*/
    
    public List<Lead> leadList = new List<Lead>();
    //constructor
    public updateLeadStatusQueueable(List<Lead> inputLeadList) {
        this.leadList = inputLeadList;
    }

    //Execute
    public void execute(QueueableContext qc){
        if(!leadList.isEmpty()){
            for(Lead ld : leadList){
                if(ld.Status == 'Working - Contacted'){
                    ld.Status = 'Closed - Converted';
                }
            }
            update leadList;
        }       
    }
}