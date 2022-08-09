public class datetimeMethodsDemo {
    
    public void calculateAgeInMonths(){
        Date birthDate = Date.newInstance(2003, 8, 2);
        Date todayDate = Date.today();
        Integer ageInMonths = birthDate.monthsBetween(todayDate);
        system.debug('Age in months: '+ageInMonths);
    }
    
    public void calculateAgeInDays(){
        Date birthDate = Date.newInstance(2003, 8, 2);
        Date todayDate = Date.today();
        Integer ageInDays = birthDate.daysBetween(todayDate);
        system.debug('Age in Days: '+ageInDays);
        
    }
    
    public void printSubscriptionEndDate(){
        Date subscriptionStartDate = Date.today();
        Date subscriptionEndDate = subscriptionStartDate.addDays(1000);
        system.debug('Start date: '+subscriptionStartDate);
        system.debug('End date: '+subscriptionEndDate);
        Integer yearEnd = subscriptionEndDate.year();
        Integer monthEnd = subscriptionEndDate.month();
        system.debug('End Year: '+yearEnd+ ' End Month: '+monthEnd);
          
    }
    
    public void printOfferEndDate(){
        DateTime offerStart = DateTime.now();
        DateTime offerEnd = offerStart.addHours(51);
        System.debug('Offer Start Date: '+offerStart);
        system.debug('Offer End Date: '+offerEnd);
    }
    
    public void printNoOfRemainingDays(){
        date subscriptionDate = date.newInstance(2021, 10, 15);
        date todayDate = date.today();
        date subscriptionEnd = subscriptionDate.addDays(365);
        Integer daysLeft = todayDate.daysBetween(subscriptionEnd);
        system.debug('Start date: '+subscriptionDate);
        system.debug('End date: '+subscriptionEnd);
        System.debug('Days remaining: '+daysLeft);        
        
    }

}