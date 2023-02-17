public with sharing class ContactTriggerHandler 
{
    public Static void afterInsertHandler(List<Contact> newRecords)
    {
        Set<Id> accountIds = new Set<Id>();
        for(Contact con : newRecords)
        {
            if(String.isNotBlank(con.AccountId))
            {
                accountIds.add(con.AccountId);
            }
        }
        AccountContactService.updateACtiveContact(accountIds);
    }
    public Static void affterUpdateHandler(List<Contact> newRecords, Map<Id,Contact> oldRecordsMap)
    {
        Set<Id> accountIds = new Set<Id>();
        for(Contact con : newRecords)
        {
            if(String.isNotBlank(con.AccountId) && oldRecordsMap.get(con.Id).Active__c!=con.Active__c)
            {
                accountIds.add(con.AccountId);
            }
            else if(oldRecordsMap.get(con.Id).AccountId!=con.AccountId)
            {
                accountIds.add(con.AccountId);
                accountIds.add(oldRecordsMap.get(con.Id).AccountId);
            }
        }
        AccountContactService.updateACtiveContact(accountIds);
        
    }
    public Static void afterDeleteHandler(List<Contact> oldRecords)
    {
        Set<Id> accountIds = new Set<Id>();
        for(Contact con : oldRecords)
        {
            if(String.isNotBlank(con.AccountId))
            {
                accountIds.add(con.AccountId);
            }
        }
        AccountContactService.updateACtiveContact(accountIds);
    }
    public Static void afterUnDeleteHandler(List<Contact> newRecords)
    {
        Set<Id> accountIds = new Set<Id>();
        for(Contact con : newRecords)
        {
            if(String.isNotBlank(con.AccountId))
            {
                accountIds.add(con.AccountId);
            }
        }
        AccountContactService.updateACtiveContact(accountIds);
    }
}