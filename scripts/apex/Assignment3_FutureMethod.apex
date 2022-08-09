List<Contact> conList = new List<Contact>();
/*for(Integer i=1;i<=5;i++){
    Contact con = new Contact();
    con.LastName = 'TestContact'+i;
    con.Email = 'salesforcesession22@gmail.com';
    conList.add(con);
}*/
/*for(Contact con : conList){
    conids.add(con.id);
}*/
Contact con = new Contact();
    con.LastName = 'TestContact';
    con.Email = 'salesforcesession22@gmail.com';
insert con;
Set<ID> conids = new Set<ID>();
conids.add(con.id);

Assignment3_FutureMethod.sendEmailToContact(conids);