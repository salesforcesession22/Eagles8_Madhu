public class practiceLoopsCollections {

    //Find the largest value in the list
    public static Decimal findLargestInList(List<Decimal> inputList){
        
		Decimal maxCompareValue = inputList[0];
        For (integer i =0;i<inputList.size();i++){            
            if(inputList[i] > maxCompareValue)
               maxCompareValue = inputList[i];             
        } 
        return maxCompareValue;
    }
    

    //Identify the values in the Map
    public static void findValuesInMap(){
        Map<String,Decimal> currISOCodeAndExchangeRateMap = new Map<String,Decimal>();
        //Key,Value - Key : ISO Code/String, Value : CoversionRate / Decimal
        currISOCodeAndExchangeRateMap.put('AUD',0.73);
        currISOCodeAndExchangeRateMap.put('CAD',0.78);
        currISOCodeAndExchangeRateMap.put('EUR',1.13);
        currISOCodeAndExchangeRateMap.put('NZD',0.68);
        currISOCodeAndExchangeRateMap.put('INR',0.013);
        
        Boolean isContainsSAD = currISOCodeAndExchangeRateMap.containsKey('SAD');
        system.debug('Does it contain SAD? '+isContainsSAD);
        
        
        Set<String> moreThanOneISOCode = new Set<String>();
        Set<String> lessThanOneISOCode = new Set<String>();
        
        for(String isoCode : currISOCodeAndExchangeRateMap.keyset()){
            if(currISOCodeAndExchangeRateMap.get(isoCode) >=1){
                moreThanOneISOCode.add(isoCode);
            }else{
                lessThanOneISOCode.add(isoCode);
            }                
        }
        
        system.debug('More than one dollar ISO Code : '+moreThanOneISOCode);
        system.debug('Less Than one dollar ISO Code : '+lessThanOneISOCode);
           
    }
    

    //Get Unique values from List
    public static Set<String> getUniqueValues(List<String> fruitsList){
        Set<String> fruitsSet = new Set<String>();
        for(String eachFruit : fruitsList){
            fruitsSet.add(eachFruit);
        }
        return fruitsSet;
    }

}