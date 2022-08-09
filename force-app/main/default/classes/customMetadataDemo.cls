public class customMetadataDemo {
    
    public static void customMetadataDemoMethod(){
        //SOQL
        List<Country_Code_cm__mdt> cusMetadataList = [Select ID,MasterLabel,DeveloperName,Country_Code__c,Telephone_Code__c from Country_Code_cm__mdt];
        system.debug('SOQL CM : '+cusMetadataList);
        //Map
        Map<String,Country_Code_cm__mdt> cusMetadataMap = Country_Code_cm__mdt.getAll();
        system.debug('Map CM : '+cusMetadataMap);
    }

}