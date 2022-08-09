public with sharing class Assignment3_FutureMethod {
    public static Boolean isSent = false;
    /* \n => next line */

    @future 
    public static void sendEmailToContact(Set<Id> contactIds){
        List<Contact> contactList = [Select ID,LastName, Email from Contact where ID IN:contactIds];
        List<Messaging.SingleEmailMessage> emailMsgs = new List<Messaging.SingleEmailMessage>();
        for(Contact con : contactList){
            Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
            String body = 'Hi '+ con.LastName +', \n\n' + 
            'A contact has been created for you. Please quote your email when you call us next time.'+
            ' \n\n'+'Thank you, \n'+'Salesforce';         
              
            emailMsg.setToAddresses(new List<String>{con.Email});
            emailMsg.setSubject('We are happy to have you in!');
            emailMsg.setPlainTextBody(body);
            emailMsgs.add(emailMsg);             
        }
        Messaging.sendEmail(emailMsgs); 
        if(!emailMsgs.isEmpty() && Test.isRunningTest()){
            isSent = true;
        }
    }
}