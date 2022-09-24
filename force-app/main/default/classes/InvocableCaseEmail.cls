public class InvocableCaseEmail {
    
    
    @InvocableMethod(label='Send Email as Activity'
                    description='Sending an email as activity when Case is created'
                    Category='case')
    public static void sendEmail(List<FlowInput> inputFlow){
        FlowInput inputValue = inputFlow.get(0);
        Contact con = [Select ID,Email from Contact where Id =:inputValue.contactId];
        
        //Sending Email
        List<Messaging.SingleEmailMessage> emailMsgs = new List<Messaging.SingleEmailMessage>();        
            Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
            List<String> emailAddress = new List<String>();
            emailAddress.add(con.Email);//add Contact Email             
            emailMsg.setToAddresses(emailAddress);
        	//Set as Activity flag
        	emailMsg.setSaveAsActivity(True);
        	//Target object is contact to display the Activity
        	emailMsg.setTargetObjectId(inputValue.contactId);
            emailMsg.setSubject('Case Created : '+inputValue.caseNumber);
            emailMsg.setPlainTextBody('We have received your request and created a Case - ' +inputValue.caseNumber+ '.'+'\nOne of our Customer representative will reach you shoortly');
            emailMsgs.add(emailMsg);                  
        Messaging.sendEmail(emailMsgs);  
    }

    
    //Wrapper
    public class FlowInput{
        @InvocableVariable(label='Case Number' description='pass the case number from flow' required=true)
        public string caseNumber;
        @InvocableVariable(label='Contact Id' description='pass the Contact Id from flow' required=true)
        public Id contactId;        
        
    }
}