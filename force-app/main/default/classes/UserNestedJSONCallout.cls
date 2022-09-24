public with sharing class UserNestedJSONCallout {

    public static void NestedJSONCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        request.setEndpoint('https://jsonplaceholder.typicode.com/users');
        request.setMethod('GET');
        response = http.send(request);
        if(response.getStatusCode() == 200){
            String jsonResponseUsers = response.getBody();
            //Main Wrapper Deserialization
            List<UserNestedJSONWrapper> resultUsers = (List<UserNestedJSONWrapper>) JSON.deserialize(jsonResponseUsers, List<UserNestedJSONWrapper>.class);
            //List for the Inner class
            List<UserNestedJSONWrapper.Address> addrList = new List<UserNestedJSONWrapper.Address>();
            List<UserNestedJSONWrapper.Company> companyList = new List<UserNestedJSONWrapper.Company>();
            List<UserNestedJSONWrapper.Geo> geoList = new List<UserNestedJSONWrapper.Geo>();
            
            //Map<Integer,List<UserNestedJSONWrapper.Address>> addrMap = new Map<Integer,List<UserNestedJSONWrapper.Address>>();
            Map<Integer,UserNestedJSONWrapper.Address> addrMap = new Map<Integer,UserNestedJSONWrapper.Address>();
            //For loop of the mainWrapper list
            //Account acc : accList
            for(UserNestedJSONWrapper res : resultUsers){
                //system.debug('Address : '+res.address);
                //addrList.add(res.address);
                addrMap.put(res.id, res.address);
                companyList.add(res.company);                
            }
            addrList = addrMap.values();
            for(UserNestedJSONWrapper.Address addrValue : addrList){
                geoList.add(addrValue.geo);
            }

            //Print AddressList
            for(UserNestedJSONWrapper.Address addr : addrList){
                system.debug('Print City : '+addr.city);
                system.debug('Print Street : '+addr.street);
                system.debug('Print Suite : '+addr.suite);
                system.debug('Print Zipcode : '+addr.zipcode);
            }

            //Print CompanyList
            for(UserNestedJSONWrapper.Company comp : companyList){
                system.debug('Print Name : '+comp.name);
                system.debug('Print bs : '+comp.bs);
                system.debug('Print catchPhrase : '+comp.catchPhrase);
            }

            //Print GeoList
            for(UserNestedJSONWrapper.Geo geo : geoList){
                system.debug('Print lat : '+geo.lat);
                system.debug('Print long: '+geo.lng);
            }

        }
    }
}