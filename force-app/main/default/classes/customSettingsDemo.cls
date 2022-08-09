public class customSettingsDemo {
    
    public static void customSettingsDemoMethod(){
        //List Custom Settings
        Map<String,Country_Code_cs__c> counCodeMap = Country_Code_cs__c.getAll();
        system.debug('Custom Settings List Type : '+counCodeMap);
        for(Country_Code_cs__c cs : Country_Code_cs__c.getAll().values()){
            system.debug('Each Code: '+cs.Country_Code__c);
        }
        //Hierarchy Custom Settings
        Golds_Gym_Membership__c gm1 = Golds_Gym_Membership__c.getorgDefaults();
        //Parameters - UserID/ProfileID
        Golds_Gym_Membership__c gm2 = Golds_Gym_Membership__c.getInstance(UserInfo.getUserId());
        Golds_Gym_Membership__c gm3 = Golds_Gym_Membership__c.getInstance('00e5i000001ZcB8');
        system.debug(gm1);
        system.debug(gm2);
        system.debug(gm3);
    }

}