public class airlineTicket {
    
    public string departureCity;
    public string arrivalCity;
    public string flightNumber;
    public string seatNumber;

    //a
    public void printTicket(){
        system.debug('This ticket is for the journey from ' +departureCity+ ' to '
                     +arrivalCity+'. Your Flight Number is '+flightNumber+' and Seat Number is '+seatNumber);        
    //Call the future method
    futureSendEmail(departureCity,arrivalCity,flightNumber,seatNumber);
    }



    @future
    //b
    public static void futureSendEmail(String departureCity,String arrivalCity,
                                       String flightNumber,String seatNumber){
   
    List<Messaging.SingleEmailMessage> emailMsgs = new List<Messaging.SingleEmailMessage>();       
            Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
            List<String> emailAddress = new List<String>();
            emailAddress.add(UserInfo.getUserEmail());
            //emailAddress.add('abc@gmail.com');
            emailMsg.setToAddresses(emailAddress);
            emailMsg.setSubject('Welcome to travel with us!');
            /*'\n' - new line/next line*/
            String body = 'Please find your ticket details below, '+'\n\n'+
            'Departure (From) : '+departureCity+'\n'+'Arrival (To) : '+arrivalCity+'\n'+
            'Flight Number : '+flightNumber+'\n'+'Seat Number : '+seatNumber+'\n\n'+
            'Have a wonderful journey!';
            emailMsg.setPlainTextBody(body);
            emailMsgs.add(emailMsg);            
    Messaging.sendEmail(emailMsgs);
    
}
}

/*airlineTicket ticket1 = new airlineTicket();
ticket1.departureCity = 'Paris';
ticket1.arrivalCity = 'New Delhi';
ticket1.flightNumber = '6E003HR';
ticket1.seatNumber = '12F';
ticket1.printTicket();

airlineTicket ticket2 = new airlineTicket();
ticket2.departureCity = 'Tokyo';
ticket2.arrivalCity = 'Berlin';
ticket2.flightNumber = 'FJFJ222';
ticket2.seatNumber = '13H';
ticket2.printTicket();*/