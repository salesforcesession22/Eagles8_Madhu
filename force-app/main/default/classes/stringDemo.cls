public class stringDemo {

    public void displayStringDemo(){
        //Demo String
        String demoString = 'We are learning string methods';

        //1.toUpperCase
        String upperString = demoString.toUpperCase();
        system.debug('Print upper Case :' +upperString);

        //2.toLowerCase
        String lowerString = demoString.toLowerCase();
        system.debug('Print Lower Case :' +lowerString);

        //3.startsWith
        Boolean startString = demoString.startsWith('We');
        system.debug('Does the String start with given value? :'+startString);

        //4.endsWith
        Boolean endString = demoString.endsWith('today');
        system.debug('Does the String end with given value? :'+endString);

        //5.length
        Integer lenString = demoString.length();
        system.debug('Length of the String is :'+lenString);

        //6.contains
        
        Boolean containsLearning = demoString.contains('learning');
        system.debug('Does the String contain the given value? :'+containsLearning);

        //7.containsIgnoreCase
        Boolean containsLearning1 = demoString.containsIgnoreCase('LEARNING');
        system.debug('Does the String contain with ignore case the given value? :'+containsLearning1);

        //8.equals - compare strings
        String val1= 'IRON MAN';
        String val2= 'Iron Man';
        Boolean testEqualsTwoString = val1.equals(val2);
        Boolean testEqualsTwoString1 = val1.equalsIgnoreCase(val2); 
        system.debug('Are 2 strings equal :'+testEqualsTwoString);
        system.debug('Are 2 strings equalIgnoreCase :'+testEqualsTwoString1);
        
        //9.equals - compare string and ID
        String testID = '0015i000006FWsVAAW';
        ID dummyValue = '0015i000006FWsVAAW';
       
        Boolean testEqualsIDString = testID.equals(dummyValue);
        system.debug('Are String and ID equal :'+testEqualsIDString);
    }
    
    public void classWork(){
        String value = 'Austin is Tax Free';
        Boolean ifContains =  value.contains('Texas');
        system.debug('Conatins or not? :'+ifContains);

        String val1 = 'BUBBLE';
        String val2 = 'Bubble'; 
        Boolean compareStrings = val1.equalsIgnoreCase(val2);
        system.debug('Same String? :'+compareStrings);
    }
}