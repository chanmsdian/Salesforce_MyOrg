public with sharing class LeadTriggerHandler 
{
    public Static void beforeInsertHandler(List <Lead> newRecords)
    {
        for (Lead leadRecord : newRecords) 
            {
                if(String.isBlank(leadRecord.LeadSource))
                    {
                        leadRecord.LeadSource='Other';
                    }
                if(String.isBlank(leadRecord.Email))
                    {
                        leadRecord.addError('Please fill values for Email field!');
                    }
                if(String.isBlank(leadRecord.Rating))
                    {
                        leadRecord.Rating='Warm';
                    }
            }
    }
    public Static void afterInsertHandler(List <Lead> newRecords)
    {
        List<Task> newTasks = new List<Task>();
        for (Lead leadRecord : newRecords) 
            {
                Task LeadTask = new Task(Subject = 'Send Letter', Priority='High', WhoId=leadRecord.id);
                newTasks.add(LeadTask);
            }
            insert newTasks;
    }
    public Static void beforeUpdateHandler(List <Lead> newRecords, Map<Id, Lead> oldRecords)
    {
        for (Lead leadRecord : newRecords) 
            {
                if(String.isBlank(leadRecord.LeadSource))
                    {
                        leadRecord.LeadSource='Other';
                    }
                if(String.isBlank(leadRecord.Email))
                    {
                        leadRecord.addError('Please fill values for Email field!');
                    }
                if(String.isBlank(leadRecord.Rating))
                    {
                        leadRecord.Rating='Warm';
                    }
                if((leadRecord.Status == 'Closed - Converted' || leadRecord.Status == 'Closed - Not Converted') 
                    && oldRecords.get(leadRecord.Id).Status=='Open - Not Contacted')
                    {
                        leadRecord.Status.addError('You cannot close an open Lead!');
                    }
            }
    }
}