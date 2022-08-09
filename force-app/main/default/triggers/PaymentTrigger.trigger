trigger PaymentTrigger on Payment__c (before insert, before update) {

if(Trigger.isBefore){
    if(Trigger.isInsert){
        PaymentTriggerHandler.beforeInsert(Trigger.new);
    }
    if(Trigger.isUpdate){
        PaymentTriggerHandler.beforeUpdate(Trigger.newMap, Trigger.oldMap);
    }
}

}