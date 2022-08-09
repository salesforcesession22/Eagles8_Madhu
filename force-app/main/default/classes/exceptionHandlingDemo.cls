public with sharing class exceptionHandlingDemo {
    public static void exceptionHandlingDemoMethod(){
        Account acc = new Account();
        
        try{
            insert acc;
        }
        catch(DmlException e){
            system.debug('Exception '+e);
        }
        finally{
            //logic here - send email
            system.debug('Finally block code');
        }
        
    }

    public static void databaseMethodsDemo(){
        List<Account> accList = new List<Account>();
        Account acc1= new Account();
        acc1.Name = 'FirstAccount';
        accList.add(acc1);
        Account acc2 = new Account();
        accList.add(acc2);
        //Database Insert - allorNothing
        List<Database.SaveResult> resultAcc = Database.insert(accList,false);
        for(Database.SaveResult result : resultAcc){
            if(result.isSuccess()){
                //Logic - create contact/opp
                system.debug('I am successful'+result.id);
            }else{
                system.debug('Sorry I failed'+result.getErrors());
            }
            
        }

    }
}