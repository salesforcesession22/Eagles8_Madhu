public with sharing class CovidCalloutUS {
    public static HttpResponse getUSCovidInfo() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        //Request
        request.setEndpoint('https://api.covidtracking.com/v1/us/current.json');
        request.setMethod('GET');

        //send request over the internet to receive response
        response = http.send(request);

        //play around response
        if(response.getStatusCode() == 200) {
            String jsonString = response.getBody();
            List<CovidWrapper> cases = (List<CovidWrapper>)JSON.deserialize(jsonString, List<CovidWrapper>.class);
            System.debug('Positive Cases: ' + cases[0].positive);
            System.debug('Negative Cases: ' + cases[0].negative);
        }
       return response;
    }
}