@isTest
public with sharing class NumberConversionSOAPMock implements WebServiceMock{

    public void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        //Mock for Number Conversion
        numberCoversionSOAP.NumberToDollarsResponse_element response_x = new numberCoversionSOAP.NumberToDollarsResponse_element();
        response_x.NumberToDollarsResult = 'Ten Thousand';
        response.put('response_x', response_x);
   }
    
}