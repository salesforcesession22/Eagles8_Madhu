trigger firstContactTrigger on Contact (before update, after update) {
    
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            //Code to perform some operation on before insert
            system.debug('I am in Before Insert');
        }
        if(Trigger.isUpdate){
            //Code to perform some operation on before update
            system.debug('I am in Before Update');
        }
    }
    
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            //Code to perform some operation on After insert
            system.debug('I am in After Insert');
        }
        if(Trigger.isUpdate){
            //Code to perform some operation on After update
            system.debug('I am in After Update');
        }
    }
    
    
    

}