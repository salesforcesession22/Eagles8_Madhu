public class SupportPlanUpdateScheduler implements Schedulable{
    
    public void execute(SchedulableContext sc){
        Database.executeBatch(new SupportPlanUpdateBatch(),50);
    }

}