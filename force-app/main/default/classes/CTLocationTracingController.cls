public with sharing class CTLocationTracingController 
{
    public Static List<Location_Tracing__c> getVisitors (String locationId)
    {
        return [SELECT Id, Person__c, Person__r.Token__c, Person__r.Health_Status__c, Location__c, Visit_Date__c 
                FROM Location_Tracing__c 
                WHERE Id=:locationId 
                ORDER BY Visit_Date__c  DESC];
    }
    public Static List<Location_Tracing__c> getLocationsByPersonIds (Set<Id> personIds)
    {
        return [SELECT Id, Person__c, Location__c 
                FROM Location_Tracing__c 
                WHERE Person__c IN :personIds
                AND Visit_Date__c = LAST_N_DAYS:10];
    }
    public Static List<Location_Tracing__c> getLocationsByLocationIds (Set<Id> locationIds)
    {
        return [SELECT Id, Person__c, Location__c 
                FROM Location_Tracing__c 
                WHERE Location__c IN :locationIds
                AND Person__r.Health_Status__c= 'Green'
                AND Visit_Date__c = LAST_N_DAYS:10];
    }
    public Static List<Location_Tracing__c> checkDuplicates(List<Location_Tracing__c> newLocationTraces)
    {
        Set<Id> locationIds = new Set<Id>();
        Set<Id> personIds = new Set<Id>();
        for( Location_Tracing__c trace : newLocationTraces)
        {
            locationIds.add(trace.Location__c);
            personIds.add(trace.Person__c);
        }
        Map<Id, Set<Id>> mapOfExistingRecords = new Map<Id, Set<Id>>();
        List<Location_Tracing__c> existingRecords=[SELECT Id, Person__c, Location__c 
                                                    FROM Location_Tracing__c 
                                                    WHERE Person__c IN :personIds
                                                    AND Location__c IN :locationIds];
        List<Location_Tracing__c> duplicates = new List<Location_Tracing__c>();
        if(existingRecords != null && existingRecords.size()>0)
        {
            for (Location_Tracing__c trace : existingRecords) 
            {   String locationId=trace.Location__c;
                String personId=trace.Person__c;
                if(!mapOfExistingRecords.containsKey(locationId))
                {
                    mapOfExistingRecords.put(locationId,new Set<Id>());
                }
                Set<Id> personsIds=mapOfExistingRecords.get(locationId);
                personsIds.add(personId);
                mapOfExistingRecords.put(locationId, personsIds);
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