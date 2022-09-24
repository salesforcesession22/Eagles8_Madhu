@isTest
public with sharing class CovidCalloutTest {
    
    @isTest 
    public static void testgetUSCovidInfo(){
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('COVIDJson');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Associate the callout with a mock response
        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse response = CovidCalloutUS.getUSCovidInfo();
        system.assertEquals(200, response.getStatusCode());
        String jsonString = response.getBody();
        List<CovidWrapper> cases = (List<CovidWrapper>)JSON.deserialize(jsonString, List<CovidWrapper>.class);
        system.assertEquals(28756489, cases[0].positive);
        system.assertEquals(74582825, cases[0].negative);
        //System.debug('Positive Cases: ' + cases[0].positive);
        //System.debug('Negative Cases: ' + cases[0].negative);
    }
}