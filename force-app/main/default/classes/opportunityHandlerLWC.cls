public with sharing class opportunityHandlerLWC {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOppsByStage(String stageName) {
        return [SELECT Name, Type, StageName, Amount
                FROM Opportunity
                WHERE StageName = :stageName WITH SECURITY_ENFORCED
                ORDER BY Name
                LIMIT 10];
    }
}