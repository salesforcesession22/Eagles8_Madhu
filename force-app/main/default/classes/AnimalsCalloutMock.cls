@isTest
public with sharing class AnimalsCalloutMock implements HttpCalloutMock{

    public HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();
        if(request.getMethod() == 'GET'){     
        // Create a fake response - GET
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}');
        response.setStatusCode(200);
         
        }
        if(request.getMethod() == 'POST'){
        // Create a fake response - POST
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animals":["majestic badger","fluffy bunny","scary bear","chicken","Tom and Jerry"]}');
        response.setStatusCode(200);
        }
        return response;
    }
    
}