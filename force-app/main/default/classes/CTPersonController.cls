public with sharing class CTPersonController 
{
    public Static String getToken(String mobileNo)
    {
        //create a blob of our mobilenum parameter and then use the crypto class to
        //encrypt the value using MD5 algo
        Blob value = Blob.valueOf(mobileNo);
        Blob hash = Crypto.generateDigest('MD5', value);
        //get the string value of the blob
        return EncodingUtil.base64Encode(hash);
    }
    public Static List<Person__c> getRecentHealthChanges()
    {
        return [SELECT Id, Health_Status__c, Mobile__c, Name, Status_Update_Date__c, Token__c 
                FROM Person__c 
                ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];
    }
    public Static List<Person__c> searchPeople(String searchTerm)
    {
        searchTerm=searchTerm+'%';
        return [SELECT Id, Health_Status__c, Mobile__c, Name, Status_Update_Date__c, Token__c 
        FROM Person__c 
            WHERE Name LIKE :searchTerm 
                OR Mobile__c LIKE :searchTerm OR Token__c LIKE :searchTerm 
                ORDER BY Status_Update_Date__c DESC NULLS LAST];
    }
    public Static Person__c getPersonById(String personId)
    {
        List<Person__c> people=[SELECT Id, Health_Status__c, Mobile__c, Name, Status_Update_Date__c, Token__c 
                                    FROM Person__c WHERE Id=: personId];
        if (people!=null && people.size()>0) 
        {
            return people[0];
        } 
        return null;
    }
    public Static Map<String, Integer> getHealthStatusCount()
    {
        Map<String, Integer> healthCounpMap = new Map<String, Integer>();
        for (AggregateResult ar : [SELECT Health_Status__c, COUNT(Id) Total 
                                        FROM Person__c 
                                        GROUP BY Health_Status__c])
        {
            healthCounpMap.put(String.valueOf(ar.get('Health_Status__c')), Integer.valueOf(ar.get('Total')));
        }
        return healthCounpMap;
    }
}