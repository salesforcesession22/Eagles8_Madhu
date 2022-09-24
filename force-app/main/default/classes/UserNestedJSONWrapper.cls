public with sharing class UserNestedJSONWrapper {
    
    public class Geo {
		public String lat;
		public String lng;
	}

	public class Company {
		public String name;
		public String catchPhrase;
		public String bs;
	}

	public Integer id;
	public String name;
	public String username;
	public String email;
	public Address address;
	public String phone;
	public String website;
	public Company company;

	public class Address {
		public String street;
		public String suite;
		public String city;
		public String zipcode;
		public Geo geo;
	}

}