public with sharing class UserContactRecordCreateCallout {
    
    /*
    1. Hit the Endpoint, and get the response
    2. Break the JSON response to readable format
    3. Create Contact records with the data received
    */

    public static void getUsers(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        //Sending the Request - GET
        request.setEndpoint('https://mockyard.herokuapp.com/users/5');
        request.setMethod('GET');
        //Response
        response = http.send(request);

        if(response.getStatusCode() == 200){
            String jsonResponseUsers = response.getBody();
            List<UserContactRecordCreateWrapper> resultUsers = (List<UserContactRecordCreateWrapper>) JSON.deserialize(jsonResponseUsers, List<UserContactRecordCreateWrapper>.class);
            for(UserContactRecordCreateWrapper result : resultUsers){
                system.debug('Each Value : '+result.id+' '+result.name+' '+result.age+' '+result.city+' '+result.country+' '+result.email+' '+result.gender+' '+result.image+' '+result.phone);
            }
            createContacts(resultUsers);
        }

    }

    public static void createContacts(List<UserContactRecordCreateWrapper> resultUsers){
        List<Contact> conList = new List<Contact>();

        for(UserContactRecordCreateWrapper result : resultUsers){
            Contact con = new Contact();
            List<String> names = result.name.split(' ');
            con.FirstName = names.get(0);
            con.LastName = names.get(1);
            con.email = result.email;
            con.Gender__c = result.gender;
            con.Image__c = result.image;
            con.Phone = result.phone;
            con.MailingCountry = result.country;
            con.MailingCity = result.city;
            con.Age__c = result.age;
            con.Description = 'This is from External API';
            conList.add(con);
        }

        if(!conList.isEmpty())
            insert conList;

    }




}