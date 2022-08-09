public class demoPrimitiveDataTypes {
    
    public void displayValues(){  
        /* Variable Declaration
           DataType VariableName =(assignment) Value
        */
        
        //String variable
        String favCharacter = 'Rachel';
        //Integer variable
        Integer Season = 10;
        //Boolean variable
        Boolean isHeCute = False;  

        system.debug('My favorite Character '+favCharacter);
        system.debug('How many seasons in Friends? '+Season);
        system.debug('Is Joey Cute? '+isHeCute);

        
        //Long variable
        Long myLongNum = 1773737L;
        //Double variable
        Double myDoubleNum = 255.88;
        system.debug('print my long number '+myLongNum);
        system.debug('print my double number'+myDoubleNum);

        //Date variable
        Date mydate = system.today();
        //ID variable
        ID mySalesforceID = '0015i000006FWsVAAW';
        //Object variable
        Object myObj1 = 1234;
        Object myObj2 = 'Object can be string';
         
        system.debug('print my date'+mydate);
        system.debug('print my ID'+mySalesforceID);
        system.debug('print the obj1'+myObj1);
        system.debug('print the obj2'+myObj2);

        //String Concatination 
        String firstName = 'Rachel';
        String lastName = 'Green';
        String fullName = firstName + lastName;
        system.debug('FullName :'+fullName);

    }

}