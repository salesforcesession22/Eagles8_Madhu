public class InvocableRollupForAccount {
    
    @InvocableMethod(label='Calculate Rollup for Account'
                     description='This method calculates the rollup of Opp and Contact of the Account'
                     Category='Account')
    public static List<FlowResponse> calculateRollup(List<Id> accIds){
        //Find the Opps
        List<Opportunity> oppList = [Select ID,Amount from Opportunity where AccountId IN: accIds];
        //Find the Contacts
        List<contact> conList = [SELECT ID FROM Contact WHERE AccountId IN: accIds];
        
        //Sum of Opps
        Decimal sum=0;
        for(Opportunity opp :oppList){
            sum +=opp.Amount; // sum = sum + opp.Amount
        }     
        
        //Declare the output
        FlowResponse response = new FlowResponse();
        response.countOfOpps = oppList.size();
        response.countOfContacts = conList.size();
        response.sumOfOpps = sum;
        List<FlowResponse> respList = new List<FlowResponse>();
        respList.add(response);
        return respList;  
        
       
       
    }
    
    //Wrapper Class
    public class FlowResponse{
        @InvocableVariable(label='Sum of Amount of Opps'
                          Description='Returns Sum of Amount of Opps for related Account')  
        public Decimal sumOfOpps;
        @InvocableVariable(label='Count of Opps'
                          Description='Returns Count of Opps for related Account')                         
        public Integer countOfOpps;
        @InvocableVariable(label='Count of Contacts'
                          Description='Returns Count of Contacts for related Account')                          
        public Integer countOfContacts;
    }

}