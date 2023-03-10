public with sharing class CTLocationController 
{
    public Static List <Location__c> getRecentStatusChanges()
    {
        return [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c FROM Location__c 
                ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];
    }
    public Static List<Location__c> searchLocations(String searchTerm)
    {
        searchTerm=searchTerm+'%';
        return [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c FROM Location__c
                WHERE Name LIKE :searchTerm OR Pincode__c LIKE :searchTerm OR Address__c LIKE :searchTerm ORDER BY Status_Update_Date__c DESC NULLS LAST];
    }
    public Static Location__c getLocationById(String locationId)
    {
        List<Location__c> locations = [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status_Update_Date__c, Status__c FROM Location__c
        WHERE Id =: locationId];
        if(locations!=null && locations.size()>0) 
        {
            return locations[0];
        } 
        return null;
    }
    public Static Map<String, Integer> getStatusCount()
    {
        Map<String, Integer> locationStatusMap = new Map<String, Integer>();
        for(AggregateResult ar : [SELECT Status__c, COUNT(Id) Total
                                    FROM Location__c
                                    GROUP BY Status__c])
                                    {
                                        locationStatusMap.put(String.valueOf(ar.get('Status__c')),Integer.valueOf(ar.get('Total')));
                                    }
        return locationStatusMap;
    }
}