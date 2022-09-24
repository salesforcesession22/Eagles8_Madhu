public with sharing class SOAPService {

    public static String numberCoversionSOAPCall(Decimal inputD){
        numberCoversionSOAP.NumberConversionSoap convert = new numberCoversionSOAP.NumberConversionSoap();
        //Decimal inputD = 30.56;
        String outputNumberToDollars = convert.NumberToDollars(inputD);
        system.debug('outputNumberToDollars : '+outputNumberToDollars);
        return outputNumberToDollars;
        /*Long inputL = 324242L;
        String outputNumberToWords = convert.NumberToWords(inputL);
        system.debug('outputNumberToWords : '+outputNumberToWords);*/
    }

    public static Double calculatorServicesCall(Double a, Double b){
        calculatorServices.CalculatorImplPort calc = new calculatorServices.CalculatorImplPort();
        //Double a = 10.5;
        //Double b = 24.5;
        Double resultAdd = calc.doAdd(a, b);
        return resultAdd;
        /*Double resultSub = calc.doSubtract(a, b);
        Double resultMultiple = calc.doMultiply(a, b);
        Double resultDivide = calc.doDivide(a, b);
        system.debug('Add : '+resultAdd+' Sub: '+resultSub+' Multiply: '+resultMultiple+' Divide: '+resultDivide);      
        */
    }

    public static void CountryInfoServicesCall(){
        CountryInfoServices.CountryInfoServiceSoap countryInfo = new CountryInfoServices.CountryInfoServiceSoap();
        CountryInfoServices.ArrayOftCurrency ListOfCurrenciesByNameResult;
        ListOfCurrenciesByNameResult = countryInfo.ListOfCurrenciesByName();
        /*Take the result in a notepad and find the CurrencyISOCodes */
        //system.debug('Result : '+ListOfCurrenciesByNameResult);
    
        String outputCurrencyName1 = countryInfo.CurrencyName('AUD');
        String outputCurrencyName2 = countryInfo.CurrencyName('PAB');
        String outputCurrencyName3 = countryInfo.CurrencyName('BBD');
        String outputCurrencyName4 = countryInfo.CurrencyName('AWG');
        system.debug('AUD Curreny Name : '+outputCurrencyName1);
        system.debug('PAB Curreny Name : '+outputCurrencyName2);
        system.debug('BBD Curreny Name : '+outputCurrencyName3);
        system.debug('AWG Curreny Name : '+outputCurrencyName4);
    }
    
}