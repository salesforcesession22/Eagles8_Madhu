
//Check Object Level Permissions
if(Schema.SObjectType.Opportunity.isAccessible()){
    //Write logic to perform DML
}

//Check Field Level Permissions
if(Schema.SObjectType.Opportunity.fields.OrderNumber__c.isUpdateable()){
    //Write logic to perform DML
}

//SOQL Security Enforcement 
List<Opportunity> oppList = [Select ID,Amount,ExpectedRevenue,
                            Discounted_Amount__c,Discount_Percentage__c
                            from Opportunity WITH SECURITY_ENFORCED];





dmlDemo.upsertDemo();

practiceDML demo = new practiceDML();
demo.createTaskforCase();
demo.updateOpps();
//Account acc = new Account(Name = 'practiceAccount');
//insert acc;
//demo.createContacts(acc);

dmlDemo.dmlDatabaseMethods();




