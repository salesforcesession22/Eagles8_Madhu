public with sharing class airlineTicketFutureScheduler implements Schedulable {
   
    //Execute
    public void execute(SchedulableContext sc){
        airlineTicket.futureSendEmail('Delhi', 'Chennai', 'FQAJJH222', '12F');
    }

}