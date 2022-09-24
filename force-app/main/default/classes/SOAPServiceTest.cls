@isTest
public with sharing class SOAPServiceTest {
    
    @isTest 
    public static void calculatorServicesCallTest(){
        Test.setMock(WebServiceMock.class, new CalculatorSOAPMock());
        Double a = 4.0;
        Double b = 2.0;
        Double result = SOAPService.calculatorServicesCall(a, b);
        system.assertEquals(6.0, result);
    }

    @isTest 
    public static void numberCoversionSOAPCallTest(){
        Test.setMock(WebServiceMock.class, new NumberConversionSOAPMock());
        String output = SOAPService.numberCoversionSOAPCall(10000);
        system.assertEquals('Ten Thousand', output);
    }
}