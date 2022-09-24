public with sharing class UsersPOSTCallout {

    //SF to External - JAVA,Python,Dotnet (Non Salesforce)

        public static void createUsersPOST(){
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            HttpResponse response = new HttpResponse();
            //Request
            request.setEndpoint('https://gorest.co.in/public/v2/users');
            request.setMethod('POST');
            request.setHeader('Content-Type', 'application/json');
            request.setHeader('Accept', 'application/json');
            String token = '60a2079f89a129654e042821ce89fc1cd47fbcedd8bb5087ff4436ce94e04986';
            request.setHeader('Authorization', 'Bearer '+token);
            //(Integer id1,String name1,String email1,String gender1,String status1)
            UsersPOSTWrapper wrapper1 = new UsersPOSTWrapper(1,'Huseyin','Huseyin@gmail.com','Male','active');
            String jsonString = JSON.serialize(wrapper1);
            system.debug('request JSON: '+jsonString);
            request.setBody(jsonString);

            response = http.send(request);
            system.debug('Response Code : '+response.getStatusCode());


        }

}