public with sharing class UserBasicAuthenticationCallout {

public static void getUsersAuthenticate(){
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    HttpResponse response = new HttpResponse();
    //Prepare the Request 
    request.setEndpoint('https://socalledrest.herokuapp.com/mock/users');
    request.setMethod('GET');
    //Create AuthorizationHeader
    String username='carbon';
    String password='hydrogen';
    Blob headerValue = Blob.valueOf(username+':'+password);
    String AuthorizationHeader = 'BASIC '+ EncodingUtil.base64Encode(headerValue);
    request.setHeader('Authorization', AuthorizationHeader);

    //Response
    response = http.send(request);
    system.debug('StatusCode : '+response.getStatusCode());
    if(response.getStatusCode() == 200){
        String jsonString = response.getBody();
        List<UserBasicAuthenticationWrapper> responseList = (List<UserBasicAuthenticationWrapper>) JSON.deserialize(jsonString, List<UserBasicAuthenticationWrapper>.class);
        for(UserBasicAuthenticationWrapper result : responseList){
            system.debug('Each Value : '+result.id+' '+result.email+' '+result.name+' '+result.username);
        }
    }

}

public static void getUsersNamedCredential(){
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    HttpResponse response = new HttpResponse();
    //Prepare the Request 
    request.setEndpoint('callout:BasicAuthenticationUser');
    request.setMethod('GET');    

    //Response
    response = http.send(request);
    system.debug('StatusCode : '+response.getStatusCode());
    if(response.getStatusCode() == 200){
        String jsonString = response.getBody();
        List<UserBasicAuthenticationWrapper> responseList = (List<UserBasicAuthenticationWrapper>) JSON.deserialize(jsonString, List<UserBasicAuthenticationWrapper>.class);
        for(UserBasicAuthenticationWrapper result : responseList){
            system.debug('Each Value : '+result.id+' '+result.email+' '+result.name+' '+result.username);
        }
    } 
}


}