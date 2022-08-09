//Annotation - It modifies the way a class/method should behave

@isTest
public class calculatorTest {
    
    @isTest
    public static void calcTest(){
        calculator calc = new calculator();
        calc.add(10,20);
        //Assertions - to validate the result (True/False)(Expected/Actual)        
        system.assertEquals(30, calc.result);
        calc.a = 10;
        calc.b = 20;
        calc.sub();
        system.assertEquals(-10, calc.result);
        calc.multiply();
        system.assertEquals(200, calc.result);
        calc.division();
        system.assertEquals(0, calc.result);
        
    }
    
    @isTest
    public static void dynamicCalulationMethodTest(){
        calculator calc = new calculator();
        Integer resultValue;
        resultValue = calc.dynamicCalulationMethod(40, 40, 'addition');
        system.assertEquals(80, resultValue);
        resultValue = calc.dynamicCalulationMethod(40, 40, 'SUBSTRACTION');
        system.assertEquals(0, resultValue);
        resultValue = calc.dynamicCalulationMethod(40, 40, 'MULTIPLICATION');
        system.assertEquals(1600, resultValue);
        resultValue = calc.dynamicCalulationMethod(40, 40, 'division');
        system.assertEquals(1, resultValue);
    }

}