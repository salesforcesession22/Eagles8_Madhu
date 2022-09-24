public class PublishOrderEvent {
    
    public static void callOrderEvent(){        
        List<Order_Event__e> orderEvents = new List<Order_Event__e>();
        orderEvents.add(new Order_Event__e(Order_Number__c = 'ABC123',Has_Shipped__c = true));
        orderEvents.add(new Order_Event__e(Order_Number__c = 'XYZ123',Has_Shipped__c = true));        
        //Publish the Event
        EventBus.publish(orderEvents);
    }

}