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
}