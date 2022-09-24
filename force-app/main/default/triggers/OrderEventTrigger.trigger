trigger OrderEventTrigger on Order_Event__e (after insert) {

    //Create Task
    List<Task> tskList = new List<Task>();
    
    for(Order_Event__e evt : Trigger.new){
        Task tk = new Task();
        tk.Subject = 'Move to Shipping - Apex';
        tk.Description = 'We have received the Order Number ' +evt.Order_Number__c+ 'to move for Shipping on ' +Date.Today()+ ', Kindly process.';
        tk.OwnerId = evt.CreatedById;
        tk.ActivityDate = Date.today() + 2;
        tskList.add(tk);
    }
    
    insert tskList;   
    
}