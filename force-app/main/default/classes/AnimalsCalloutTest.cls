@isTest
public with sharing class AnimalsCalloutTest {
    @isTest 
    public static void getAnimals(){
        //Setting the Mock
        //AnimalsCalloutMock mock = new AnimalsCalloutMock();
        Test.setMock(HttpCalloutMock.class, new AnimalsCalloutMock());
        HttpResponse response = AnimalsCallout.fetchAnimals1();
        string expectedValue = '{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}';
        system.assertEquals(expectedValue, response.getBody());
        system.assertEquals(200, response.getStatusCode());
    }

    @isTest 
    public static void postAnimals(){
        Test.setMock(HttpCalloutMock.class, new AnimalsCalloutMock());
        HttpResponse response = AnimalsCallout.postAnimals();
        system.assertEquals(200, response.getStatusCode());
    }
}