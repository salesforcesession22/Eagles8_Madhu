public class demoWhileDoWhile {
    
    public void demoWhile(){
        Integer count = 1;
        while(count == 11){
            system.debug('Print values: '+count);
            count++;
        }
    }
    
    public void demoDoWhile(){
        Integer count = 12;
        do{
            system.debug('Print values: '+count);
            count++;
        }while(count <=15);
    }

}