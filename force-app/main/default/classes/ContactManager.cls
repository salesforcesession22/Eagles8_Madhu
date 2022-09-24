@RestResource(urlMapping='/Contact/*') //Step 1
global class ContactManager {

    public class CustomException extends Exception {} //Step 2
    
    @HttpGet // Step 3
    global static Contact getContact() {
        RestRequest request = RestContext.request;
        String url = request.requestURI;
        String contactId = url.substring(url.lastIndexOf('/')+1);
        if(contactId.length() == 18) {
            List<Contact> con = [Select Id, Title, FirstName, LastName, Email, Phone FROM Contact WHERE Id = :contactId];
            //List<Contact> con = [Select Id, Title, FirstName, LastName, Email, Phone, (Select ID,Status,Priority from Cases) FROM Contact WHERE Id = :contactId];
            //List Size 0 / or Empty => No record
            if(!con.isEmpty()) {
                return con[0];
            } else {
                throw new CustomException('Contact not present!');
            }
        } else {
            throw new CustomException('Please send a valid 18 digit contact id!');
        }
    }

    @HttpPost //Step 4
    global static Id createContact() {
        RestRequest request = RestContext.request;
        String jsonString = request.requestBody.toString();
        Contact con = (Contact)JSON.deserialize(jsonString, Contact.class);
        if(con.LastName == '' || con.LastName == null) {
            throw new CustomException('Last name is mandatory!');
        }
        insert con;
        return con.Id;
    }

    @HttpDelete //Step 5
    global static String deleteContact() {
        RestRequest request = RestContext.request;
        String url = request.requestURI;
        String contactId = url.substring(url.lastIndexOf('/')+1);
        List<Contact> contacts = [Select Id FROM Contact WHERE Id = :contactId];
        if(!contacts.isEmpty()) {
            delete contacts;
            return 'Contact has been deleted successfully!';
        } else {
            throw new CustomException('Couldn\'t find any contact with the given id');
        }
    }

    @HttpPut //Step 6 - Upsert
    global static Contact upsertContact() {
        RestRequest request = RestContext.request;
        String jsonString = request.requestBody.toString();
        Contact con = (Contact)JSON.deserialize(jsonString, Contact.class);
        if(con.LastName == '' || con.LastName == null) {
            throw new CustomException('Last name is mandatory!');
        }
        upsert con;
        return [Select Id, Title, FirstName, LastName, Email, Phone FROM Contact WHERE Id = :con.Id];
    }

    @HttpPatch //Step 7 - Update
    global static Contact patchContact() {
        RestRequest request = RestContext.request;
        String jsonString = request.requestBody.toString();
        //deserializeUntyped => Key,Value Pairs
        Map<String, Object> contactRequest= (Map<String, Object>)JSON.deserializeUntyped(jsonString);
        Contact con = new Contact();
        for(String key : contactRequest.keySet()) {
            if(key != 'attributes') {
                con.put(key, contactRequest.get(key));//con.firstname = contactRequest.get('FirstName');
            }
        }
        update con;
        return [Select Id, Title, FirstName, LastName, Email, Phone FROM Contact WHERE Id = :con.Id];
    }

}