public with sharing class CustomMetadataHelper {
    public static Decimal getCurrencyRate(String currencyISOCode) {        
        
        //Approach 1
        Map<String,Currency_Conversion__mdt> curMap = Currency_Conversion__mdt.getAll();
        Decimal rate;
        for(String cur : curMap.keySet()){
            rate = curMap.get(cur).Rate__c;
        }
        return rate;

        //Approach 2
        /*Map<String,Currency_Conversion__mdt> curMap = Currency_Conversion__mdt.getAll();
        Decimal rate;
        for(Currency_Conversion__mdt cur : curMap.values()){
            if(cur.DeveloperName.equals(currencyISOCode)){
                rate = cur.Rate__c;
            }            
        }
        return rate;*/

        //Approach 3
        /*Currency_Conversion__mdt coversionRecord = Currency_Conversion__mdt.getInstance(currencyISOCode);
          return coversionRecord.Rate__c;*/

        //Approach 4
        /*Currency_Conversion__mdt curValue = [Select ID,DeveloperName,Rate__c from Currency_Conversion__mdt where DeveloperName =:currencyISOCode LIMIT 1];
        return curValue.Rate__c;*/
    }
}