/*1. Create a JSON : Account - Name, Type, Rating, AnnualRevenue */
{
    "Name" : "Grand Hotels & Resorts Ltd",
    "Type" : "Customer - Direct",
    "Rating" : "Hot",
    "AnnualRevenue" : 100000000
}

/*Contact - FirstName, LastName, Email*/
{
    "FirstName" : "Sean",
    "LastName" : "Forbes",
    "Email" : "sean@edge.com"
}

/*2. SOQL sObject Records and make it JSON */
//JSON.serialize(o)

Account acc = [Select ID, Name, Type, Rating, AnnualRevenue from Account LIMIT 1];
String jsonStringAcc = JSON.serialize(acc);
system.debug('Print Account JSON : '+jsonStringAcc);

Contact con = [Select FirstName,LastName,Email from Contact LIMIT 1];
String jsonStringCon = JSON.serialize(con);
system.debug('Print Contact JSON : '+jsonStringCon);

List<Account> accList = [Select ID, Name, Type, Rating, AnnualRevenue from Account LIMIT 5];
String jsonStringAcc = JSON.serialize(accList);
system.debug('Print Account JSON : '+jsonStringAcc);

List<Contact> con = [Select FirstName,LastName,Email from Contact LIMIT 5];
String jsonStringCon = JSON.serialize(con);
system.debug('Print Contact JSON : '+jsonStringCon);

/*3.JSON to sObject Record */
//JSON.deserialize(jsonString, apexType)
Account acc = [Select ID, Name, Type, Rating, AnnualRevenue from Account LIMIT 1];
String jsonStringAcc = JSON.serialize(acc);
//String JsonAcc = '"{\"attributes\":{\"type\":\"Account\",\"url\":\"/services/data/v55.0/sobjects/Account/0015i000006P0QTAA0\"},\"Id\":\"0015i000006P0QTAA0\",\"Name\":\"TestGeo\",\"Type\":\"ChannelPartner/Reseller\",\"Rating\":\"Hot\",\"AnnualRevenue\":1234560000}"';
Account acc1 = (Account) JSON.deserialize(JsonAcc, Account.class);
system.debug('New Account Deserialize : '+acc1);

List<Account> accList = [Select ID, Name, Type, Rating, AnnualRevenue from Account LIMIT 5];
String jsonStringAcc = JSON.serialize(accList);
system.debug('Print Account JSON : '+jsonStringAcc);
List<Account> accList2 = (List<Account>)JSON.deserialize(jsonStringAcc, List<Account>.class);
system.debug('New Account List : '+accList2);

/*XML*/
//JSON
{
    "Name" : "Grand Hotels & Resorts Ltd",
    "Type" : "Customer - Direct",
    "Rating" : "Hot",
    "AnnualRevenue" : 100000000
}

//XML
<Account>
    <Name>Grand Hotels & Resorts Ltd</Name>
    <Type>Customer - Direct</Type>
    <Rating>Hot</Rating>
    <AnnualRevenue>100000000</AnnualRevenue>
</Account>




