public class calculator {
    public Integer a,b;
    public Integer result; 

    /*public calculator() {
         a=10;
         b=5;
    }  */          
                public void add(Integer c,Integer d){                   
                    result = c + d;
                    system.debug('Added value:'+result);
                }

                public void sub(){
                    result = a-b;
                    system.debug('Sub value:'+result);
                }
                public void multiply(){
                    result = a*b;
                    system.debug('Multiply value:'+result);
                }
                public void division(){
                    result = a/b;
                    system.debug('division value:'+result);
                }

public Integer dynamicCalulationMethod(Integer num1,Integer num2,String operation){
    Integer result;

    if(operation.equalsIgnoreCase('addition')){
        result = num1 + num2;
    }else if(operation.equalsIgnoreCase('SUBSTRACTION')){
        result = num1 - num2;
    }else if(operation.equalsIgnoreCase('DIVISION')){
        result = num1 / num2;
    }else if(operation.equalsIgnoreCase('MULTIPLICATION')){
        result = num1 * num2;
    }

    return result;
}
}