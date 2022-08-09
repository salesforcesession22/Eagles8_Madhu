public class primitiveDateTypeDateDemo {
    
    public void printDate(){
        /*Create New Date - Year YYYY, Month MM, Day DD*/
        Date myDate= Date.newInstance(2022, 01, 01);
        system.debug('Print Date: '+myDate);         
    }

    public void printTime(){
        /*Create New Time - hour, minute, second, millisecond*/        
        Time myTime= Time.newInstance(12, 32, 32, 32);
        system.debug('Print Time: '+myTime);         
    }
    
    public void printDateTime(){
        Date newDate= Date.newInstance(2022, 3, 25);
        Time newTime = Time.newInstance(12, 12, 20, 50);
        /*1. Create New DateTime with Date and Time*/
        DateTime myDateTime1 = DateTime.newInstance(newDate, newTime);
        system.debug('Print DateTime 1: '+myDateTime1);
        /*2. Create New DateTime with Integer Year Month*/
        DateTime myDateTime2 = DateTime.newInstance(2000, 12, 20);
        system.debug('Print DateTime 2: '+myDateTime2);
        /*3. Create New DateTime with year, month, day, hour, minute, second*/
        DateTime myDateTime3 = DateTime.newInstance(2007, 10, 24, 7, 20, 40);
        system.debug('Print DateTime 3: '+myDateTime3);
        /*4. Create New DateTime with Long Time*/
        Long longTime = 123456789000L;
        DateTime myDateTime4 = DateTime.newInstance(longTime);
        system.debug('Print DateTime 4: '+myDateTime4);
        /*5. Create New DateTime with GMT Date and Time*/
        DateTime myDateTime5 = DateTime.newInstanceGmt(newDate, newTime);
        system.debug('Print DateTime 5: '+myDateTime5);
        
    }
    
    public void sampleMethods(){
       Date date1 = Date.newInstance(2022, 1, 1);
       Date date2 = date1.addDays(2);
        system.debug('Print New Date: '+date2);
       Time time1 = Time.newInstance(6, 6, 5, 43);
       Time time2 = time1.addHours(3);
        system.debug('Print Old Time: '+time1);
        system.debug('Print New Time: '+time2);
        DateTime datetime1 = DateTime.newInstance(date2, time2);
        Integer hour1 = datetime1.hour();
        system.debug('Hour of DateTime: '+hour1);
         
    }

}