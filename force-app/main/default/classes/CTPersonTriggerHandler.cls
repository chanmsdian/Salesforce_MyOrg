public with sharing class CTPersonTriggerHandler 
{
    public static void beforeInsertHandler(List <Person__c> newRecords) 
    {
        for (Person__c person : newRecords) 
            {
                person.Health_Status__c = 'Green';
                person.Token__c = CTPersonController.getToken(person.Mobile__c);
            }
    }
    public static void beforeUpdateHandler(List<Person__c> newRecords, Map<Id, Person__c> oldRecordsMap)
    {
        for(Person__c person : newRecords)
        {
            if(person.Health_Status__c != oldRecordsMap.get(person.id).Health_Status__c)
            {
                person.Status_Update_Date__c= Date.today();
            }
        }
    }
    public static void afterUpdateHandler(List<Person__c> newRecords, Map<Id, Person__c> oldRecordsMap)
    {
        Set<Id> statusChange = new Set<Id>();
        Set<Id> redStatus = new Set<Id>();
        for(Person__c person : newRecords)
        {
            if(person.Health_Status__c != oldRecordsMap.get(person.id).Health_Status__c)
            {
                statusChange.add(person.Id);
            }
            if(person.Health_Status__c == 'Red' && oldRecordsMap.get(person.id).Health_Status__c!='Red')
            {
                redStatus.add(person.Id);
            }
        }
        Set<Id> orangeStatus = new Set<Id>();
        Set<Id> yellowStatus = new Set<Id>();
        Set<Id> alreadyProcessed = new Set<Id>();
        alreadyProcessed.addAll(redStatus);
        orangeStatus.addAll(CTPersonController.getCohabitants(redStatus, alreadyProcessed));
        Set<Id> primaryCotacts = CTPersonController.getPrimaryContacts(redStatus, alreadyProcessed);
        orangeStatus.addAll(primaryCotacts);
        yellowStatus.addAll(CTPersonController.getNeighbours(redStatus, alreadyProcessed));
        yellowStatus.addAll(CTPersonController.getSecondaryContacts(primaryCotacts, alreadyProcessed));

        List<Id> personToUpdate = new List<Id>();
        for (Id pid : orangeStatus) 
        {
            personToUpdate.add(new Person__c(Id=pid, Health_Status__c='Orange'));
        }
        for (Id pid : yellowStatus) 
        {
            personToUpdate.add(new Person__c(Id=pid, Health_Status__c='Yellow'));
        }

        update personToUpdate;


    }
}