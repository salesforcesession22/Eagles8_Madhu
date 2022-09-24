public with sharing class contactCtrlLWC {
    
    @AuraEnabled
    public static List<Contact> searchContacts(String searchKey){
        searchKey = '%' + searchKey + '%'; 
        return [SELECT FirstName, LastName, Title, Department
                FROM Contact
                WHERE FirstName LIKE :searchKey
                OR LastName LIKE :searchKey
                WITH SECURITY_ENFORCED];
    }

    @AuraEnabled
    public static List<Contact> get10Contacts(){        
        return [SELECT FirstName, LastName, Title, Department
                FROM Contact               
                WITH SECURITY_ENFORCED LIMIT 10];
    }
}