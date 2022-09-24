public with sharing class UsersPOSTWrapper {
    public Integer id;
	public String name;
	public String email;
	public String gender;
	public String status;

    public UsersPOSTWrapper(Integer id1,String name1,String email1,String gender1,String status1){
        this.id = id1;
        this.name = name1;
        this.email = email1;
        this.gender = gender1;
        this.status = status1;
    }



    /* 
    //Wrapper
    public Integer oppAmount;
    public String conEmail;
    public Integer accRevenue;

    //JSONInputString
    Opportunity opp = [Select Amount from opportunity limit 1];
    Contact con = [Select Email from Contact limit 1];
    Account acc = [Select AnnualRevenue from Account limit 1];
    UsersPOSTWrapper wrapper1 = new UsersPOSTWrapper();
    wrapper1.oppAmount = opp.amount;
    wrapper1.conEmail = con.Email;
    wrapper1.accRevenue = acc.AnnualRevenue;
    String jsonInputString = JSON.serialize(wrapper1);
    */
}