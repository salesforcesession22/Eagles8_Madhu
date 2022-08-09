public class AccountRecursiveTriggerHandler {
    
    public static Boolean isTriggerFirstRun = false;
    
    public static void recursivePractice(List<Account> accTriNew){
        
        isTriggerFirstRun = true;
        List<Account> accList = new List<Account>();
        for(Account acc : accTriNew){
            Account accDup = new Account();
            accDup.Name = 'Recursive Duplicate';
            accList.add(accDup);
        }
        if(!accList.isEmpty())
            insert accList;        
    } 
    

}