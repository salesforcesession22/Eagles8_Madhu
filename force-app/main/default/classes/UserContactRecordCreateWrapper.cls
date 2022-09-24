public with sharing class UserContactRecordCreateWrapper {

    //Create Contact Record based on the JSON 
    public Integer id; //Not required
	public String name; //Map it to FirstName / LastName
	public String email; //Map it to Email
	public String gender; //Map it to gender (picklist)
	public String image; //Map it to image (URL)
	public String phone; //Map it to phone
	public String country; //Map it to mailing country
	public String city; //map it to mailing city
	public Integer age; //map it to age

}