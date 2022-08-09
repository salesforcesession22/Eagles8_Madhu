public class demoForLoop {
    
    public void demoInitialization(){
        for(Integer i=1; i<=10; i++){
			//Integer count = i+1;            
            system.debug('Print i: '+i);
        } 
        
    }
    
    public void print_N_Odd_Numbers(integer startValue,  integer endValue){
        //math.mod(10,4); startValue - 3, endValue -15
        //3,5,7,9,11,13,15 
        
        for(Integer i=startValue ; i<=endValue ;i++){
            Integer modValue = math.mod(i, 2); //3%2 5%2 6%2
            if(modValue == 1){
            system.debug('Print Odd: '+i); 
            }
        }
    }
    
    public void multiplicationtable(integer inputNum){
        for(integer i=1; i<=10 ;i++){
           Integer multipleValue =  i * inputNum;
           //system.debug('Display the table values: '+multipleValue);
           system.debug(i+ ' * ' +inputNum+ ' = '+multipleValue);
        }
    }
    
    public void demoIterateList(){
        List<String> namesList = new List<String>();
        namesList.add('Busra');
        namesList.add('Yusuf');
        namesList.add('Seda');
        namesList.add('Oner');
        namesList.add('Berna');
        namesList.add('Bahar');
        namesList.add('Numan');
        namesList.add('Bahar');
        namesList.add('Numan');
        system.debug('Print List: '+namesList);        
        for(String nameValue : namesList){
            system.debug('Values inside the list '+nameValue);
        }  
        
        //namesList.get(0)
    }
    
    public void demoIterateSet(){
        set<string> fruitsSet1 = new set<string>();
        fruitsSet1.add('apple');  //Apple     
        fruitsSet1.add('orange'); //Orange
        fruitsSet1.add('kiwi');
        fruitsSet1.add('mango');
        fruitsSet1.add('fig');  
        system.debug('Set1: '+fruitsSet1);
        
        set<string> fruitsSet2 = new set<string>(); 
        
        for(string fruitName : fruitsSet1){
            //system.debug('Fruit Name: '+fruitName);
            String newFruitName = fruitName.capitalize();
            fruitsSet2.add(newFruitName);             
        }
        system.debug('Set2: '+fruitsSet2);
        
        
    }
    
    public void demoIterateMap(){
        //Key - Integer dataType
        //Value - String dataType
        Map<Integer,String> employeeMap = new Map<Integer,String>();
        employeeMap.put(123,'Madhu');
        employeeMap.put(234,'Sri');
        employeeMap.put(345,'Huseyin');
        employeeMap.put(456,'Sara');
        employeeMap.put(567,'Ben');
        
        set<integer> keysOfMap = new set<integer>();
        keysOfMap = employeeMap.keyset();
        
        for(Integer empKey: keysOfMap) {
            String empNameValue = employeeMap.get(empKey);
            system.debug('Key is '+empKey+ ' and value is '+empNameValue);
        }       
        
    }

}