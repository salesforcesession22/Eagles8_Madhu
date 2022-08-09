//Create 2 Accounts
List<account> myList=new List<Account>(); 
Account acc1=new Account();
acc1.Name='Test 1';
myList.add(acc1);
Account acc2=new Account();
acc2.Name='Test 2';
myList.add(acc2);
//List<account> myList=new List<Account>{acc1,acc2}; 
insert myList;

//Validate that the account got inserted/created - SOQL
//List<Account> newList=[Select name,id from Account LIMIT 2];
List<Account> newList = [SELECT Name FROM Account WHERE Name = 'Test 1' OR Name = 'Test 2'];
system.assertEquals('Test 1', newList.get(0).Name);
system.assertEquals('Test 2', newList.get(1).Name);

//Loop and change the name of the account
for(Account each:newList){
    each.Name='Test account';
}
update newList;

//create contacts (child records) 
//1.Parent has to be created - Account
//2.get the ID of the parent record
//3.Create the contact with the parent id, AccountID = acc.id
//4.Create 2/more contacts for each account(10) - Loop through parent and Loop and create contact