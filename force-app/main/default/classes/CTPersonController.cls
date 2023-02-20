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
    public Static Set<Id> getCohabitants(Set<Id> personIds)
    {
        List<String> healthStatuses = new List<String>{'Green','Yellow'};
        List<People_Tracing__c> peoplaTraces = [SELECT Person_1__c, Person_2__c FROM People_Tracing__c
                                                WHERE (Person_1__c IN :personIds OR Person_2__c IN :personIds)
                                                AND Contact_Type__c = 'Cohabitant'
                                                AND (Person_1__r.Health_Status__c IN :healthStatuses OR Person_2__r.Health_Status__c IN :healthStatuses)];


        Set<Id> cohabitants = new Set<Id>();
        for(People_Tracing__c pt : peoplaTraces)
        {
            if(personIds.contains(pt.Person_1__c))
            {
                cohabitants.add(pt.Person_1__c);
            }
            if(personIds.contains(pt.Person_2__c))
            {
                cohabitants.add(pt.Person_2__c);
            }
        }
        return cohabitants;
    }
    public Static Set<Id> getNeighbours(Set<Id> personIds)
    {
        List<People_Tracing__c> peoplaTraces = [SELECT Person_1__c, Person_2__c FROM People_Tracing__c
                                                WHERE (Person_1__c IN :personIds OR Person_2__c IN :personIds)
                                                AND Contact_Type__c = 'Neighbour'
                                                AND (Person_1__r.Health_Status__c = 'Green' OR Person_2__r.Health_Status__c = 'Green')];

        Set<Id> neighbours = new Set<Id>();
        for(People_Tracing__c pt : peoplaTraces)
        {
            if(personIds.contains(pt.Person_1__c))
            {
                neighbours.add(pt.Person_1__c);
            }
            if(personIds.contains(pt.Person_2__c))
            {
                neighbours.add(pt.Person_2__c);
            }
        }
        return neighbours;
    }
    public Static Set<Id> getPrimaryContacts(Set<Id> personIds)
    {
        List<String> healthStatuses = new List<String>{'Green','Yellow'};
        List<People_Tracing__c> peoplaTraces = [SELECT Person_1__c, Person_2__c FROM People_Tracing__c
                                                WHERE (Person_1__c IN :personIds OR Person_2__c IN :personIds)
                                                AND Contact_Type__c = 'Other'
                                                AND Contact_Date__c = LAST_N_DAYS:10
                                                AND (Person_1__r.Health_Status__c IN :healthStatuses OR Person_2__r.Health_Status__c IN :healthStatuses)];
        Set<Id> primaryContacts = new Set<Id>();
        for(People_Tracing__c pt : peoplaTraces)
        {
            if(personIds.contains(pt.Person_1__c))
            {
                primaryContacts.add(pt.Person_1__c);
            }
            if(personIds.contains(pt.Person_2__c))
            {
                primaryContacts.add(pt.Person_2__c);
            }
        }
        return primaryContacts;
    }
    public Static Set<Id> getSecondaryContacts(Set<Id> primaryContactsId)
    {
        List<String> healthStatuses = new List<String>{'Green','Yellow'};
        List<People_Tracing__c> peoplaTraces = [SELECT Person_1__c, Person_2__c FROM People_Tracing__c
                                                WHERE (Person_1__c IN :primaryContactsId OR Person_2__c IN :primaryContactsId)
                                                AND Contact_Type__c = 'Other'
                                                AND Contact_Date__c = LAST_N_DAYS:10
                                                AND (Person_1__r.Health_Status__c IN :healthStatuses OR Person_2__r.Health_Status__c IN :healthStatuses)];
        Set<Id> secondaryContacts = new Set<Id>();
        for(People_Tracing__c pt : peoplaTraces)
        {
            if(primaryContactsId.contains(pt.Person_1__c))
            {
                secondaryContacts.add(pt.Person_1__c);
            }
            if(primaryContactsId.contains(pt.Person_2__c))
            {
                secondaryContacts.add(pt.Person_2__c);
            }
        }
        return secondaryContacts;
    }     
}