public class LoopDemoPractice {    
    //Multiplication table
    public void displayMultiplicationTable(Integer inputNum){
        Integer i=0;
        for(i=1;i<=10;i++){
            system.debug(i+ ' * '+inputNum+' = '+i*inputNum);
        }
    }    
    
    //Sum of Integers
    public integer sumOfIntegers(List<Integer> inputList){
        Integer sum = 0;
        if(!inputList.isEmpty()){
            for(Integer i=0; i<inputList.size(); i++){
                sum = sum + inputList.get(i);
            }
        }
        return sum;
    }     
    

    //Reverse a List
    public void reverseListValues(){
        List<Integer> originalList = new List<Integer>{10,20,30,40,50};
        List<Integer> reverseList = new List<Integer>();
        for(Integer i=originalList.size()-1;i>=0;i--){
            reverseList.add(originalList.get(i));
        }
        system.debug('Original List: '+originalList);
        system.debug('Reverse List: '+reverseList);
    }
    
    //Update values in Map in a format
     public static void updateMap(){
        Map<Integer,String> studentMap = new Map<Integer,String>();
        studentMap.put(1001,'James');
        studentMap.put(1002,'Kate');
        studentMap.put(1003,'Jenny');
        studentMap.put(1004,'Sandra');
        studentMap.put(1005,'Marc');
        system.debug('studentMap before changes:'+studentMap);
        Set<Integer> rollNumSet = studentMap.keyset();
        Integer i =1;
        for(Integer rollNum : rollNumSet){            
            String fullDetails = studentMap.get(rollNum) + ' - ' + 'Student ' +i;
            studentMap.put(rollNum,fullDetails);
            i++;
        }
        system.debug('studentMap after changes:'+studentMap);
    }
}