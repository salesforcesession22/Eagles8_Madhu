trigger AccountFlowTirgger on Account (after insert) {
 
    for(Account acc : Trigger.new){
        if(acc.Rating == 'Hot'){
            callTheFlow();
        }
    }
    
    public void callTheFlow(){ 

        Account accSOQL = [Select ID,Name,CreatedBy.name,OwnerId FROM Account where id IN: trigger.new LIMIT 1]; 
        Map<String,Object> inputValues = new Map<String, Object>();
        inputValues.put('AccountId',accSOQL.id);
        inputValues.put('AccountName',accSOQL.Name);
        inputValues.put('CreatedByName',accSOQL.CreatedBy.name);
        inputValues.put('OwnerId',accSOQL.OwnerId);

        Flow.Interview flow = new Flow.Interview.Auto_Launch_Acc_Create_Task_Post_Chatter(inputValues);
        flow.start(); 
  
            
    }
}