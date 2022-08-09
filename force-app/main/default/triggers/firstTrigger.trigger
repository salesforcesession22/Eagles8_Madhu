trigger firstTrigger on Account (after update) {
  
        //trigger.newMap => <ID,Account>
    
    if(Trigger.isBefore && Trigger.isInsert){
        system.debug('Display values on Before insert : '+Trigger.New);
        
        
    }
    
    if(Trigger.isAfter && Trigger.isInsert){
        system.debug('Display values on After insert : '+Trigger.New);
       
    }
    
    if(Trigger.isBefore && Trigger.isUpdate){
        system.debug('Old Values: '+Trigger.Old);
        system.debug('New Values: '+Trigger.New); 
        List<Account> accListOld = Trigger.Old;
        List<Account> accListNew = Trigger.new;
    }
    
    if(Trigger.isAfter && Trigger.isUpdate){
        system.debug('Old Values Map: '+Trigger.OldMap);
        system.debug('New Values Map: '+Trigger.NewMap); 
        Map<ID,Account> oldMap = Trigger.OldMap;
        Map<ID,Account> newMap = Trigger.NewMap;
    }


}