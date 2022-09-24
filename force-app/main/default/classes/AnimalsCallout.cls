public with sharing class AnimalsCallout {    

    /* 1. Open a Connection
       2. Preparing the Request - Set Endpoint / Set Method
       3. Capturing the response 
     */

     public static HttpResponse fetchAnimals1(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        //Sending the Request - GET
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        //Response
        //Account acc = [Select ID from Account]
        response = http.send(request);
        system.debug('StatusCode : '+response.getStatusCode());
        System.debug('response Body: '+response.getBody());
        if(response.getStatusCode() == 200){   //Success : 200/201 & Error : 400/401/500     
            String jsonResponseAnimals = response.getBody();
            AnimalsWrapper result = (AnimalsWrapper) JSON.deserialize(jsonResponseAnimals, AnimalsWrapper.class);
            for(String animal: result.animals){
                system.debug('Each Animals : '+animal);
            }  

            
        }     
        
        return response;
     }

     public static HttpResponse fetchAnimals2(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals:');
            for(Object animal: animals) {
                System.debug(animal);
            }
        }
        return response;
     }

     public static HttpResponse postAnimals(){

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Set the body as a JSON object
        request.setBody('{"name":"Tom and Jerry"}');
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if(response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }

        return response;
     }

}