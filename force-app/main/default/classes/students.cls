public class students {
    
    public string firstName;
    public string lastName;
    public integer classYear;
    public string majorStream;
    
    public string generateReport(){
        system.debug('Report Generated for '+firstName+' '+lastName+' of '+classYear);
        return majorStream;
    }

}


/*students stud = new students();
stud.firstName = 'Silver';
stud.lastName = 'Jubliee';
stud.classYear = 2;
stud.majorStream = 'Physics';
String returnValue = stud.generateReport();
system.debug('Print Major/Stream: '+returnValue);*/