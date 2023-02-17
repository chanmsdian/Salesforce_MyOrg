public with sharing class Test 
{
    public Static List<Location_Tracing__c> checkDuplicates(List<Location_Tracing__c> newLocationTraces)
    {
        set <Id> locationIds = new set<Id>();
        set <Id> personIds = new set<Id>();
        List <Location_Tracing__c> existingRecords= [SELECT Id, Person__c, Location__c 
                                                        FROM Location_Tracing__c 
                                                        WHERE Person__c IN :personIds
                                                        AND Location__c IN :locationIds];
        for (Location_Tracing__c trace : existingRecords) 
        {
            locationIds.add(trace.Location__c);
            personIds.add(trace.Person__c);
        }
        Map<Id, Set<Id>> mapOfExistingRecords = new Map<Id, Set<Id>>();
        List<Location_Tracing__c> duplicates = new List<Location_Tracing__c>();
        if(existingRecords != null && existingRecords.size()>0)
        {
            for (Location_Tracing__c trace : existingRecords) 
            {
                if(!mapOfExistingRecords.containsKey(trace.Location__c))
                {
                    mapOfExistingRecords.put(trace.Location__c, new set<Id>());
                }
                mapOfExistingRecords.get(trace.Location__c).add(trace.Location__c);
            }
            for (Location_Tracing__c trace : newLocationTraces) 
            {
                if(mapOfExistingRecords.containsKey(trace.Location__c) 
                    && mapOfExistingRecords.get(trace.Location__c).contains(trace.Person__c))
                {
                    duplicates.add(trace);
                }
            }
        }
        return duplicates;
    }
}