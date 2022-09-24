public with sharing class accountHandlerLWC {
    @AuraEnabled(cacheable=true)
    public static List<Account> getTopAccounts() {
        return [SELECT Name, Type, Industry, AnnualRevenue
                FROM Account
                WITH SECURITY_ENFORCED
                ORDER BY AnnualRevenue DESC
                LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsByIndustry(String industry) {
        return [SELECT Name, Type, Industry, AnnualRevenue
                FROM Account
                WHERE Industry = :industry
                ORDER BY Name
                LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAllAccounts(){
        return [Select ID,Name,AccountNumber from Account with SECURITY_ENFORCED ORDER BY Name];
    }

    @AuraEnabled
    public static Integer countContacts(Id accId){
        /*AggregateResult[] countCons = [SELECT COUNT(ID)countCon from Contact where AccountId =: accId WITH SECURITY_ENFORCED];
        Integer countContact;
        for (AggregateResult ar : countCons)  {
            countContact = Integer.valueOf(ar.get('countCon'));
        }
        return Integer.valueOf(countCons.get(0).get('countCon'));
        */
        List<Contact> contacts = [SELECT Id FROM Contact WHERE AccountId =: accId WITH SECURITY_ENFORCED];
        return contacts.size();
    }
}